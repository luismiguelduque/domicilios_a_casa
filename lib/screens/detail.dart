import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

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
        child: _buttonVisitWebSite(context, company[0].siteUrl),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(224, 224, 224, 0.2),
          ),
          child: ListView(
            children: <Widget>[
              Image.network(
                company[0].imageUrl,
                fit: BoxFit.cover,
              ),
              _cardElement(context, company[0].name, company[0].address, company[0].description),              
              Wrap(
                alignment: WrapAlignment.center,
                children: company[0].tags.map((item) => _listTag(context, item)).toList(),
              ),
              SizedBox(height: 90.0,),
            ],
          ),
        
        ),
      ),
    );
  }

  Widget _listTag(BuildContext context, String item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 2.0,
            color: Color.fromARGB(50, 0, 0, 0),    
            spreadRadius: 0.5,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.check, 
            color: Theme.of(context).primaryColor,
            size: 20.0,
          ),
          SizedBox(width: 5.0),
          Text(
            item,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardElement(BuildContext context, String name, String address, String description) {
    return Card(
      margin: EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: 400.0,
        child: Column(
          children: <Widget>[
            Text(
              name,
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
                    address,
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
              description,
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonVisitWebSite(BuildContext context, String url) {
    return GestureDetector(
      onTap: (){
        _launchURL(url);
      },
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
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}