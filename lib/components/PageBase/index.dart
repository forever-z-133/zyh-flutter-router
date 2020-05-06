import 'package:flutter/material.dart';
import 'package:zyh_flutter_router/tools/location.dart';

class PageBase extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Container(
      child: GestureDetector(
          onTap: () {
            location.push('/about');
          },
          child: new Text('hello')),
    );
  }
}
