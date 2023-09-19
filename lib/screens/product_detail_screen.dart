import 'package:flutter/material.dart';
import 'package:realshop/widgets/app_drawer.dart';
import 'package:realshop/widgets/cart_item.dart';
import 'package:realshop/widgets/product_grid.dart';

import '../widgets/product_item.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      drawer: appdrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
              ))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_sharp,
            )),
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
      body: cartItem(product: product),
    );
  }
}
