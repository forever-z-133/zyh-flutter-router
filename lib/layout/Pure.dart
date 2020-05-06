import 'package:flutter/material.dart';

class PureLayout extends StatelessWidget {
  final Widget child;
  PureLayout({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: child,
    );
  }
}
