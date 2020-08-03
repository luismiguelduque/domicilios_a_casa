import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: size.height-50,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:25, vertical:10),
                      child: Image(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20,),
                    _item(context, "Todos los comercios", "home", Icons.store, Icons.arrow_forward_ios, false),
                    _item(context, "Supermercados", "home", Icons.store, Icons.arrow_forward_ios, false),
                    _item(context, "Abastos", "home", Icons.store, Icons.arrow_forward_ios, false),
                    _item(context, "Farmacias", "home", Icons.store, Icons.arrow_forward_ios, false),
                    _item(context, "Comida rápida", "home", Icons.fastfood, Icons.arrow_forward_ios, false),
                    _item(context, "Licores", "home", Icons.local_drink, Icons.arrow_forward_ios, false),
                    _item(context, "Ferreterías", "home", Icons.store, Icons.arrow_forward_ios, false),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical:8),
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    children: [
                      _item(context, "Anuncia tu negocio", "about", Icons.markunread, null, true),
                      _item(context, "Acerca de nosotros", "about", Icons.info_outline, null, true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _item(BuildContext context, String text, String route, IconData leading, IconData trailing, bool isBottom){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, route);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical:8),
        child: Row(
          children: [
            Expanded(flex: 1, child: Icon(leading, size: 30, color: !isBottom ? Colors.black : Colors.white,)),
            Expanded(flex: 4, child: Text(text, style: !isBottom ? Theme.of(context).textTheme.headline4 : Theme.of(context).textTheme.headline5 ,)),
            if(trailing != null) Expanded(flex: 1, child: Icon(trailing, size: 20,))
          ],
        ),
      ),
    );
  }
}