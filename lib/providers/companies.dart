import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/company.dart';

class Companies with ChangeNotifier {
  
  List<Company> _items = [
    Company(
      id: "1",
      name: "Bodega de la esquina",
      description: "Bodega de la esquina",
      siteUrl: "https://www.google.com",
      address: "Calle 4-58 Medellin Colombia",
      imageUrl: "https://media-cdn.tripadvisor.com/media/photo-s/12/22/03/09/justo-ceres.jpg"
    ),
    Company(
      id: "1",
      name: "Supermercado Demi",
      description: "Supermercado Demi",
      siteUrl: "https://www.demi.com",
      address: "AV. Mariño 14-3 Medellin Colombia",
      imageUrl: "https://res.cloudinary.com/civico/image/upload/c_fit,f_auto,fl_lossy,h_1200,q_auto:low,w_1200/v1453501148/entity/image/file/007/000/56a2aa842f41f32f5b000007.jpg"
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