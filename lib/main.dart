import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realshop/providers/auth.dart';
import 'package:realshop/providers/cart.dart';
import 'package:realshop/providers/orders.dart';
import 'package:realshop/providers/pro.dart';
import 'package:realshop/screens/auth2-screen.dart';
import 'package:realshop/screens/auth_screen.dart';
import 'package:realshop/screens/cart_screen.dart';
import 'package:realshop/screens/edit_product.dart';
import 'package:realshop/screens/orders_screen.dart';
import 'package:realshop/screens/product_detail_screen.dart';
import 'package:realshop/screens/product_overview_screen.dart';
import 'package:realshop/screens/splash_screen.dart';
import 'package:realshop/screens/user_product_screen.dart';
import 'package:realshop/widgets/app_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Orders()),
        ChangeNotifierProvider.value(value: pro()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF3D82AE)),
            fontFamily: 'lato'),
        routes: {
          "AuthScreen": (__) => AuthScreen(),
          "EditProduct": (__) => EditProduct(),
          "OrdersScreen": (__) => OrdersScreen(),
          "SplashScreen": (__) => SplashScreen(),
          "UserProductScreen": (__) => UserProductScreen(),
          "Auth2Screen": (__) => Auth2Screen(),
        },
        home: ProductOverviewScreen(),
      ),
    );
  }
}
