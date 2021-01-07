import 'dart:async';

import 'package:flutter/material.dart';

class Timer1 extends StatefulWidget {
  @override
  _Timer1State createState() => _Timer1State();
}

class _Timer1State extends State<Timer1> {
  Timer _timer;
  static const _interval = const Duration(seconds: 3);
  int _counter = 10;

  @override
  void dispose() {
    print('dispose _Timer1State');
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build $_counter');
    _timer ??= Timer.periodic(_interval, (Timer timer) {
      if (_counter == 0) _counter = 10;
      setState(() {
        _counter--;
      });
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              FlutterLogo(),
              Text('test $_counter'),
              TextStateless(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('TextStateless');
    return const Text('Text Stateless');
  }
}
