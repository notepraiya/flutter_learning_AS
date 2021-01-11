import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class DataModel with ChangeNotifier {
  int counter = 0;
  int counter2 = 2;
  int counter3 = 3;

  void increment() {
    counter++;
    notifyListeners();
  }

  void increment2() {
    counter2 += 2;
    notifyListeners();
  }

  void increment3() {
    counter3 += 3;
    notifyListeners();
  }
}

class Provider2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('render Provider2/StatelessWidget');
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => DataModel(),
        child: TextFour(),
      ),
    );
  }
}

class TextFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('render TextFour/StatelessWidget');
    return Column(
      children: [
        RaisedButton(
          onPressed: () {
            print('pressed');
            //Provider.of<DataModel>(context, listen: false).increment();
            //Provider.of<DataModel>(context, listen: false).increment2();
            Provider.of<DataModel>(context, listen: false).increment3();
          },
          child: Text('TextFour'),
        ),
        const SizedBox(
          height: 16.0,
        ),
        TextFourOne(),
        const SizedBox(
          height: 16.0,
        ),
        Selector<DataModel, Tuple2<int, int>>(
          selector: (_, dataModel) => Tuple2(dataModel.counter2, dataModel.counter3),
          builder: (context, data, __) => Column(
            children: [
              TextFourTwo(),
              const SizedBox(
                height: 16.0,
              ),
              TextFourThree(),
            ],
          ),
        ),
      ],
    );
  }
}

class TextFourOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('render Child TextFourOne/StatelessWidget');
    return Text(
      'TextFourOne',
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}

class TextFourTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('render Child TextFourTwo/StatelessWidget');
    return Text(
      'TextFourTwo',
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}

class TextFourThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('render Child TextFourThree/StatelessWidget');
    return Text(
      'TextFourThree',
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}
