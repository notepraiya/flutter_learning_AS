import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class TapboxBParent extends StatefulWidget {
  @override
  _TapboxBParentState createState() => _TapboxBParentState();
}

class _TapboxBParentState extends State<TapboxBParent> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Center(
          child: TapboxB(
            active: _active,
            onChanged: _handleTapboxChanged,
          ),
        ),
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxB({
    Key key,
    this.active: false,
    @required this.onChanged,
  }) : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
