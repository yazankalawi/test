import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:realshop/screens/orders_screen.dart';
import 'package:realshop/screens/user_product_screen.dart';
import 'package:realshop/screens/auth_screen.dart';

class appdrawer extends StatelessWidget {
  const appdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/per.jpg")),
            accountName: Text("yazan"),
            accountEmail: Text("yazan.killawee@gmail.com")),
        ListTile(
          title: Text("shop"),
          leading: Icon(Icons.shop),
          onTap: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
        ListTile(
          title: Text("orders"),
          leading: Icon(Icons.shopping_cart_checkout),
          onTap: () {
            Navigator.of(context)..pushNamed("OrdersScreen");
          },
        ),
        ListTile(
          title: Text("manage products"),
          leading: Icon(Icons.edit),
          onTap: () {
            Navigator.of(context)..pushNamed("UserProductScreen");
          },
        ),
        ListTile(
          title: Text("Logout"),
          leading: Icon(Icons.logout),
        ),
      ]),
    );
  }
}
