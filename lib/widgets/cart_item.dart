// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:realshop/widgets/product_item.dart';

class cartItem extends StatelessWidget {
  final Product product;
  const cartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(children: <Widget>[
        SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.36),
                padding: EdgeInsets.only(
                    top: size.height * 0.12, left: 10, right: 10),
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "this bag beuty",
                      style: TextStyle(
                          fontFamily: 'lato',
                          fontSize: 22,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(text: "Price\n"),
                          TextSpan(
                              text: "\$${product.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                        ])),
                      ),
                      Expanded(
                          child: Image.asset(
                        product.image,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fitWidth,
                        height: 300,
                      ))
                    ],
                  ),
                  textandcolorch(product: product),
                  description(product: product),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      counter(),
                      fav(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      Center(
                        child: Container(
                            height: 50,
                            width: 300,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: product.color,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                onPressed: () {},
                                child: Text(
                                  "add to cart",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontFamily: 'lato',
                                          fontWeight: FontWeight.bold),
                                ))),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class fav extends StatelessWidget {
  const fav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, right: 25),
      width: 32,
      height: 32,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      child: Icon(
        Icons.favorite,
        color: Colors.white,
      ),
    );
  }
}

class counter extends StatelessWidget {
  const counter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: 150,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 40,
            width: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(2.5),
                  primary: Colors.white60,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13))),
              onPressed: () {},
              child: Icon(
                Icons.remove,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              "10",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    backgroundColor: Colors.white60,
                  ),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(2.5),
                  primary: Colors.white60,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13))),
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class description extends StatelessWidget {
  const description({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text(
        "${product.description}",
        style: TextStyle(height: 1.5),
      ),
    );
  }
}

class textandcolorch extends StatelessWidget {
  const textandcolorch({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "color",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                ),
              ),
              Row(
                children: [
                  colorsch(
                    color: Color(0xFF356c95),
                    isSelected: true,
                  ),
                  colorsch(
                    color: Color(0xFFF8c078),
                  ),
                  colorsch(
                    color: Color(0xFFA29B9B),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
              text: TextSpan(style: TextStyle(color: Colors.black), children: [
            TextSpan(text: "Size\n"),
            TextSpan(
                text: "${product.size} cm",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ])),
        )
      ],
    );
  }
}

class colorsch extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const colorsch({
    super.key,
    required this.color,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 20),
      padding: EdgeInsets.all(2.5),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
          border: Border.all(color: isSelected ? color : Colors.transparent),
          shape: BoxShape.circle),
      child: DecoratedBox(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
    );
  }
}
