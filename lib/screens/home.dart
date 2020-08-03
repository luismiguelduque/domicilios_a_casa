import 'package:flutter/material.dart';
import 'dart:math';

import 'package:provider/provider.dart';

import '../models/company.dart';
import '../providers/companies.dart';
import '../widgets/custom_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Provider.of<Companies>(context, listen: false).getCompanies();
    super.initState();
  }
   
  @override
  Widget build(BuildContext context) {
    final companiesProvider = Provider.of<Companies>(context);
    final companies = companiesProvider.items;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: size.height*0.1,
                left: -size.width*0.4,
                child: Container(
                  transform: Matrix4.rotationZ(-15 * pi / 80),
                  height: size.height*0.5,
                  width: size.width*0.8,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(224, 224, 224, 1),
                    borderRadius: BorderRadius.circular(150)
                  ),
                ),
              ),
              Positioned(
                bottom: -size.height*0.3,
                right: -size.width*0.4,
                child: Container(
                  transform: Matrix4.rotationZ(-10 * pi / 80),
                  height: size.height*0.5,
                  width: size.width*0.8,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(224, 224, 224, 1),
                    borderRadius: BorderRadius.circular(150)
                  ),
                ),
              ),
              Positioned(
                top: 50,
                child: Container(
                  height: size.height-50,
                  width: size.width-10,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 5,),
                          Icon(Icons.location_on, color: Theme.of(context).primaryColor,),
                          SizedBox(width: 5,),
                          Text("Medellin", style: TextStyle(fontSize: 22),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Expanded(
                        child: ListView.builder(
                          itemCount: companies.length,
                          itemBuilder: (ctx, index){
                            return _listItem(companies[index]);
                          },
                        ),
                      ),
                      SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 5,
                child: _customAppBar(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customAppBar(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width-10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: (){
              if(_scaffoldKey.currentState.isDrawerOpen){
                _scaffoldKey.currentState.openEndDrawer();
              }else{
                _scaffoldKey.currentState.openDrawer();
              }
            },
            icon: Icon(Icons.menu, color: Theme.of(context).primaryColor, size: 30,),
          ),
          Text("Domicilios a casa", style: Theme.of(context).textTheme.headline2,),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.map, color: Theme.of(context).primaryColor, size: 30,),
          ),
        ],
      ),
    );
  }

  Widget _listItem(Company company){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('detail', arguments: company);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ]
        ),
        child: ListTile(
          leading: Image(
            image: NetworkImage(company.imageUrl),
          ),
          title: Text(company.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
          subtitle: Text(company.siteUrl, style: TextStyle(color: Theme.of(context).primaryColor),),
          trailing: IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed('detail', arguments: company);
            },
            icon: Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor, size: 28,),
          ),
        ),
      ),
    );
  }
}