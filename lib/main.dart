import 'package:flutter/material.dart';

import 'package:flutter_learning_as/http/http1.dart';
import 'package:flutter_learning_as/timers/timer1.dart';
import 'package:flutter_learning_as/websocket/ws1.dart';
import 'animates/animate1.dart';
import 'animates/animate2.dart';
import 'animates/animate3.dart';
import 'animates/animate4.dart';
import 'animates/animate5.dart';
import 'snackbar/snackbar.dart';
import 'states/problem.dart';
import 'states/provider1.dart';
import 'states/provider2.dart';
import 'states/tapbox_c.dart';
import 'states/tapbox_b.dart';
import 'states/tapbox_a.dart';
import 'layouts/adding_interactivity.dart';
import 'layouts/building_layouts.dart';
import 'package:flutter_learning_as/my_home_page.dart';

import 'tabbar/tabbar1.dart';

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
      // home: Problem(),
      // home: Provider1(),
      // home: Provider2(),
      // home: Animate1(),
      // home: Animate4(),
      // home: Animate5(),
      // home: Timer1(),
      // home: Scaffold(body: SafeArea(child: Http1())), //Need Scaffold cuz using TextField
      // home: Scaffold(body: SafeArea(child: Ws1(title: 'test'))), //Need Scaffold cuz using TextField
      // home: Scaffold(body: SafeArea(child: Snackbar())),
      home: TabBar1(title: 'demo tabbar'),
    );
  }
}
