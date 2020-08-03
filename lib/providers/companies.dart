import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/company.dart';

class Companies with ChangeNotifier {
  
  List<Company> _items = [
    Company(
      id: "1",
      name: "Tu tienda de la esquina",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit",
      siteUrl: "https://carnes-la-avenida.exposistema.com",
      address: "Calle 4-58 Medellin Colombia",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTKmuPHfzrRNcOoedJb1D0LFxv02stkZ90F3g&usqp=CAU",
      phone: "+57 3241574854",
      email: "tutiendadelaesquina@gmail.com",
      tags: [
        "Viveres", "Confites", "Frutas", "Verduras", "Licores"
      ]
    ),
    Company(
      id: "1",
      name: "Supermercado Demi",
      description: "commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      siteUrl: "https://tu-cosecha.exposistema.com",
      address: "AV. Mariño 14-3 Medellin Colombia",
      imageUrl: "https://res.cloudinary.com/civico/image/upload/c_fit,f_auto,fl_lossy,h_1200,q_auto:low,w_1200/v1453501148/entity/image/file/007/000/56a2aa842f41f32f5b000007.jpg",
      phone: "+57 542541254854",
      email: "demicuadra@gmail.com",
      tags: [
        "Viveres", "Confites", "Frutas", "Verduras", "Licores", "Farmacia", "Ferretería", "Carpintería", "Electicidad", "Autopartes"
      ]
    ),
    Company(
      id: "1",
      name: "Hambuguesas Doña Carmen",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      siteUrl: "https://quiero-mi-evento.exposistema.com",
      address: "Barrio La calera Medellin Colombia",
      imageUrl: "https://media-cdn.tripadvisor.com/media/photo-s/12/22/03/09/justo-ceres.jpg",
      phone: "+57 14524574854",
      email: "donacarmen@gmail.com",
      tags: [
        "Hamburguesas", "HotDogs", "Pizzas", "Licores", "A la carta", "Batidos"
      ]
    ),
  ];

  List<Company> get items {
    return [..._items];
  }

  Future<void> getCompanies() async {
    final url = "https://domicilios-a-casa.firebaseio.com/companies.json";
    try{
      final response = await http.get(url);
      final extractedResponse = json.decode(response.body) as Map<String, dynamic>;
      if(extractedResponse == null){
        return;
      }
      final List<Company> loadedCompanies = [];
      extractedResponse.forEach((id, data) { 
        loadedCompanies.insert(0, Company(
          name: data["name"],
          description: data["description"],
          siteUrl: data["siteUrl"],
          imageUrl: data["imageUrl"],
          address: data["address"],
        ));
      });
      _items = loadedCompanies;
      notifyListeners();
    }catch(error){
      print(error);
    }
  }

  Future<void> addCompany(Company company) async {
    final url = "https://domicilios-a-casa.firebaseio.com/companies.json";
    try{
      final response = await http.post(url, body: json.encode({
        "name": company.name,
        "description": company.description,
        "siteUrl": company.siteUrl,
        "imageUrl": company.imageUrl,
        "address": company.address,
      }));
      final newCompany = Company(
        id: json.decode(response.body)['name'],
        name: company.name,
        description: company.description,
        siteUrl: company.siteUrl,
        imageUrl: company.imageUrl,
        address: company.address,
      );
      _items.add(newCompany);
      notifyListeners();
    }catch(error){
      print(error);
    }
  }

}