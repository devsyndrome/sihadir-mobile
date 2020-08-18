import 'package:flutter/material.dart';
import 'package:sihadir/Screens/Welcome/welcome_screen.dart';
import 'package:sihadir/constant.dart';
import 'package:sihadir/screens/product/products_screen.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SiHadir',
      routes: {'dashboard': (context) => ProductsScreen()},
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: WelcomeScreen(),
    );
  }
}
