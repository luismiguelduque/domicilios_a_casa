import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/company.dart';

class Companies with ChangeNotifier {
  
  List<Company> _items;

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

    }
    

  }

}