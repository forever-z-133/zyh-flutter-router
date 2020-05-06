import 'package:flutter/material.dart';
import 'package:zyh_flutter_router/layout/AppBar.dart';
import 'package:zyh_flutter_router/layout/Default.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefalutLayout(
      child: new Center(
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
            child: new Text('hello')),
      ),
      appBar: commonAppBar(
          title: '首页', rightSlot: new Container(child: new Text('转发'))),
    );
  }
}
