// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:realshop/screens/product_detail_screen.dart';
import 'package:realshop/widgets/product_item.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Text(
            "Categeries",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: 'lato',
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Categeries(),
          height: 50,
        ),
        Expanded(
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.75,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Caaard(
                    product: products[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                                  product: products[index],
                                ))),
                  )),
        )
      ],
    );
  }
}

class Caaard extends StatelessWidget {
  final Product product;
  final Function press;
  const Caaard({
    super.key,
    required this.product,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product)));
      },
      child: Column(
        children: [
          Container(
            height: 180,
            width: 160,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: product.color, borderRadius: BorderRadius.circular(16)),
            child: Image.asset(product.image),
          ),
          Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                product.title,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.bold),
              )),
          Text(
            "${product.price}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class Categeries extends StatefulWidget {
  const Categeries({super.key});

  @override
  State<Categeries> createState() => _CategeriesState();
}

class _CategeriesState extends State<Categeries> {
  List<String> categories = [
    "house",
    "resturunt",
    "villa",
    "company",
    "factory"
  ];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => buildcatog(index)),
      ),
    );
  }

  Widget buildcatog(int index) => GestureDetector(
        onTap: () {
          setState(() {
            selectedindex = index;
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                categories[index],
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'lato',
                    fontWeight: FontWeight.bold,
                    color: selectedindex == index
                        ? Colors.black
                        : Colors.blueGrey),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 2,
                width: 40,
                color:
                    selectedindex == index ? Colors.black : Colors.transparent,
              )
            ],
          ),
        ),
      );
}
