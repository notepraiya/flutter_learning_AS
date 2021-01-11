import 'package:flutter/material.dart';

class Problem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('render Problem');
    return SafeArea(
      child: Column(
        children: [
          TextOne(),
          const SizedBox(height: 30),
          TextTwo(),
          const SizedBox(height: 30),
          TextThree(),
        ],
      ),
    );
  }
}

// ------------------- TextOne --------------------------
class TextOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('render TextOne/StatelessWidget');
    return Text(
      'TextOne/StatelessWidget',
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}

// ------------------- TextTwo --------------------------
class TextTwo extends StatefulWidget {
  @override
  _TextTwoState createState() => _TextTwoState();
}

class _TextTwoState extends State<TextTwo> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    print('render TextTwo/StatefulWidget');
    return Column(
      children: [
        Text(
          'TextTwo/StatefulWidget $_counter',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        RaisedButton(
          onPressed: () {
            print('---------------------');
            print('TextTwoButton/pressed');
            setState(() {
              _counter++;
            });
          },
          child: const Text('TextTwoButton', style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}

// ------------------- TextThree --------------------------
class TextThree extends StatefulWidget {
  @override
  _TextThreeState createState() => _TextThreeState();
}

class _TextThreeState extends State<TextThree> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    print('render TextThree/StatefulWidget');
    return Column(
      children: [
        Text(
          'TextThree/StatefulWidget $_counter',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        RaisedButton(
          onPressed: () {
            print('-----------------------');
            print('TextThreeButton/pressed');
            setState(() {
              _counter++;
            });
          },
          child: const Text('TextThreeButton', style: TextStyle(fontSize: 20)),
        ),
        TextThreeOne(),
      ],
    );
  }
}

class TextThreeOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('render Child TextThreeOne/StatelessWidget');
    return Text(
      'TextThreeOne/StatelessWidget',
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}
