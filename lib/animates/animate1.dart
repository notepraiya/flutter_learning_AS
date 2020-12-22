import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class Animate1 extends StatefulWidget {
  @override
  _Animate1State createState() => _Animate1State();
}

class _Animate1State extends State<Animate1>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: animation.value,
      width: animation.value,
      child: FlutterLogo(),
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
