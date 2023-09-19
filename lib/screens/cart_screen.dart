import 'package:flutter/material.dart';
import 'package:realshop/widgets/product_item.dart';

class CartScreen extends StatelessWidget {
  final Product product;
  const CartScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Container(
                height: 500,
                decoration: BoxDecoration(color: Colors.white),
              )
            ],
          ),
        )
      ]),
    );
  }
}
