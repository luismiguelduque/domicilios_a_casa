import 'package:flutter/material.dart';

import '../models/company.dart';

class Detail extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final  List<Company> company = [ModalRoute.of(context).settings.arguments];
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle de comercio"),
      ),
      floatingActionButton: GestureDetector(
        onTap: (){},
        child: Container(
          width: 150.0,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(100, 0, 0, 0),
                blurRadius: 8, 
                spreadRadius: 2,
                offset: Offset(3, 3)
              )
            ]
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.open_in_browser, 
                color: Colors.white,
                size: 28.0,
              ),
              SizedBox(width: 5.0),
              Text(
                'Ir al sitio',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(224, 224, 224, 0.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(
              company[0].imageUrl,
              fit: BoxFit.cover,
            ),
            Card(
              margin: EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.all(20.0),
                width: 400.0,
                child: Column(
                  children: <Widget>[
                    Text(
                      company[0].name,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.location_on, 
                            color: Color.fromRGBO(150, 150, 150, 1),
                            size: 16.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            company[0].address,
                            style: TextStyle(
                              color: Color.fromRGBO(150, 150, 150, 1),
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      )
                    ),
                    Text(
                      company[0].description,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      
      ),
    );
  }
}