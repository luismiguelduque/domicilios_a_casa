import 'package:flutter/material.dart';

import './screens/home.dart';
import './screens/detail.dart';
import './screens/about.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Domicilios a casa',
      initialRoute: 'home',
      routes: {
        'home' : (context) => Home(),
        'detail' : (context) => Detail(),
        'about' : (context) => About(),
      },
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 112, 6, 1),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),
          headline6: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}