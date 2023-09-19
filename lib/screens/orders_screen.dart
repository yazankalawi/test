// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:realshop/widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: appdrawer(),
      // ignore: prefer_const_constructors
      appBar: AppBar(),
    );
  }
}
