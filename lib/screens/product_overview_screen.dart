// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:realshop/widgets/app_drawer.dart';

import '../widgets/product_grid.dart';

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      drawer: appdrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF3D82AE),
        actions: [
          IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed("AuthScreen");
              },
              icon: Icon(Icons.login)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0))),
        title: const Text(
          "My Shop",
          style:
              TextStyle(color: Colors.white, fontSize: 22, fontFamily: 'Anton'),
        ),
      ),
    );
  }
}
