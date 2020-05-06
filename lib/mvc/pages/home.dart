import 'package:flutter/material.dart';
import 'package:zyh_flutter_router/mvc/mvc_location_api.dart';

/*
 * 页面 - 首页
 */
class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          // new FlatButton(
          //   onPressed: () {},
          //   child: new Text('跳详情')
          // ),
          // new Text('hello'),
          new GestureDetector(
            onTap: () => location.push('/about'),
            child: new Text('to about'),
          ),
        ],
      ),
    );
  }
}
