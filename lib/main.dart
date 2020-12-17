import 'package:flutter/material.dart';
import 'package:flutter_learning_as/my_home_page.dart';
import 'package:flutter_learning_as/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Learning AS',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // home: MyHomePage(title: 'Flutter Learning AS'),
      home: Category(
        name: 'Hello, Category',
        color: Colors.lightBlue,
        iconLocation: Icons.cake,
      ),
    );
  }
}
