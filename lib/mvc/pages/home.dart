import 'package:flutter/material.dart';

/*
 * 页面 - 首页
 */
class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return new Container(
    //   child: new Text('hello'),
    // );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: new Container(
    //     child: new Row(
    //       children: <Widget>[
    //         new FlatButton(
    //           onPressed: () {},
    //           child: new Text('跳详情')
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return new Container(
      child: new Row(
        children: <Widget>[
          // new FlatButton(
          //   onPressed: () {},
          //   child: new Text('跳详情')
          // ),
          new Text('hello'),
          FlatButton(onPressed: () {}, child: new Text('1'),)
        ],
      ),
    );
  }
}
