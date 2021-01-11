import 'package:flutter/material.dart';

class Snackbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('A SnackBar has been shown.'),
          ),
        );
      },
      child: Text('Show SnackBar'),
    );
  }
}
