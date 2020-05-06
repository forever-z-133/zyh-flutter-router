import 'package:flutter/material.dart';
import 'package:zyh_flutter_router/layout/Pure.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PureLayout(
      child: new Center(
        child: new Text('about'),
      ),
    );
  }
}
