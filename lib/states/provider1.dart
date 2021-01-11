import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple
// https://www.youtube.com/watch?v=d_m5csmrf7I

class Provider1 extends StatefulWidget {
  @override
  _Provider1State createState() => _Provider1State();
}

class _Provider1State extends State<Provider1> {
  @override
  Widget build(BuildContext context) {
    print('render Provider1/StatefulWidget');

    return SafeArea(
      child: ChangeNotifierProvider(
        create: (BuildContext context) => MyChangeNotifier(),
        child: Column(
          children: [
            TextThree(),
          ],
        ),
      ),
    );
  }
}

class TextThree extends StatefulWidget {
  @override
  _TextThreeState createState() => _TextThreeState();
}

class _TextThreeState extends State<TextThree> {
  @override
  Widget build(BuildContext context) {
    print('render TextThree/StatefulWidget');

    return Consumer<MyChangeNotifier>(
      builder: (context, myChangeNotifier, child) {
        print('render TextThree/StatefulWidget inside Consumer');
        return Column(
          children: [
            Text(
              'TextThree/StatefulWidget ',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            RaisedButton(
              onPressed: () {
                print('-----------------------');
                print('TextThreeButton/pressed');
                myChangeNotifier.increment();
                print('TextThree change counter by "notifyListeners()" ${myChangeNotifier.counter}');
              },
              child:
                  const Text('TextThreeButton', style: TextStyle(fontSize: 20)),
            ),
            TextThreeOne(),
            child,
          ],
        );
      },
      child: TextThreeTwo(),
    );
  }
}

class TextThreeOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myChangeNotifier = Provider.of<MyChangeNotifier>(context, listen: false);
    print(
        'render Child TextThreeOne/StatelessWidget ${myChangeNotifier.counter}');
    return Column(
      children: [
        Text(
          'TextThreeOne/StatelessWidget ${myChangeNotifier.counter}',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        RaisedButton(
          onPressed: () {
            print('TextThreeOne change counter by "myChangeNotifier.counter += 10"');
            myChangeNotifier.counter += 10;
          },
          child: Text('TextThreeOneButton'),
        ),
      ],
    );
  }
}

class TextThreeTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myChangeNotifier = Provider.of<MyChangeNotifier>(context, listen: false);
    print(
        'render Child TextThreeTwo/StatelessWidget ${myChangeNotifier.counter}');
    return Text(
      'TextThreeTwo/StatelessWidget ${myChangeNotifier.counter}',
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}


class MyChangeNotifier extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

// No need / got warning 'avoid wrapping fields in getters and setters just to be safe'
// https://dart.dev/guides/language/effective-dart/usage#:~:text=DON'T%20wrap%20a%20field%20in%20a%20getter%20and%20setter%20unnecessarily.,-Linter%20rule%3A%20unnecessary_getters_setters&text=Dart%20doesn't%20have%20this,code%20that%20uses%20that%20field.

// int _counter;
// int get counter => _counter;
//
// set counter(int val) {
//   _counter = val;
// }

}
