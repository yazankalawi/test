import 'package:flutter/material.dart';
import 'package:realshop/widgets/app_drawer.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user product"),
      ),
      drawer: appdrawer(),
    );
  }
}
