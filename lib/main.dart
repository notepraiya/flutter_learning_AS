import 'package:flutter/material.dart';
import 'package:flutter_learning_as/http/http1.dart';
import 'package:flutter_learning_as/timers/timer1.dart';
import 'animates/animate1.dart';
import 'animates/animate2.dart';
import 'animates/animate3.dart';
import 'animates/animate4.dart';
import 'animates/animate5.dart';
import 'states/tapbox_c.dart';
import 'states/tapbox_b.dart';
import 'states/tapbox_a.dart';
import 'layouts/adding_interactivity.dart';
import 'layouts/building_layouts.dart';
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
      // home: TapboxCParent(),
      // home: Animate1(),
      // home: Animate4(),
      //home: Animate5(),
      // home: Timer1(),
      home: Http1(),
    );
  }
}
