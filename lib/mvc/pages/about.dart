import 'package:flutter/material.dart';
import 'package:zyh_flutter_router/mvc/mvc_location_api.dart';

/*
 * 页面 - 详情
 */
class PageAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new GestureDetector(
            onTap: () => location.back(),
            child: new Text('about'),
          ),
        ],
      ),
    );
  }
}
