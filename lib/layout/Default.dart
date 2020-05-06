import 'package:flutter/material.dart';
import 'package:zyh_flutter_router/layout/AppBar.dart';

class DefalutLayout extends StatelessWidget {
  final Widget child;
  final Widget appBar;
  DefalutLayout({Key key, @required this.child, this.appBar, Widget bottomBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBar != null ? appBar : commonAppBar(),
      body: child,
    );
  }
}
