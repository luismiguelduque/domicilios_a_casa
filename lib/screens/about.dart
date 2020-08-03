import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre nosotros"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal:25, vertical:10),
              child: Image(
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30,),
            Text("www.domicilios-a-casa.com", style: Theme.of(context).textTheme.headline3, textAlign: TextAlign.end,),
            SizedBox(height: 5,),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}