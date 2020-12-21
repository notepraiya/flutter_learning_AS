import 'package:flutter/material.dart';
import 'tapbox_c.dart';
import 'tapbox_b.dart';
import 'tapbox_a.dart';
import 'package:flutter_learning_as/adding_interactivity.dart';
import 'package:flutter_learning_as/building_layouts.dart';
import 'package:flutter_learning_as/my_home_page.dart';

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
        primarySwatch: Colors.amber,
      ),
      // home: MyHomePage(title: 'Flutter Learning AS'),
      // home: AddingInteractivity(),
      // home: TapboxA(),
      // home: TapboxBParent(),
      home: TapboxCParent(),
    );
  }
}
