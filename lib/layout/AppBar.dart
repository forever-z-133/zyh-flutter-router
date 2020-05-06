import 'package:flutter/material.dart';
import 'package:zyh_flutter_router/tools/index.dart';

PreferredSizeWidget commonAppBar({title, Widget rightSlot}) {
  // 左右两边的元素
  final iconBack = 'assets/images/icon_return.png';
  final barElements = <Widget>[
    new GestureDetector(
      onTap: () {},
      child: new Image.asset(iconBack, width: px(48), height: px(48)),
    )
  ];
  if (rightSlot != null) {
    barElements.add(rightSlot);
  }
  // 中间的标题
  final titleElement = Positioned(
    top: 0,
    left: px(375 - 200),
    width: px(400),
    height: px(60),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          title != null ? title : '',
          style: new TextStyle(fontSize: px(30.0)),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
  // 返回布局
  return new PreferredSize(
    child: new Container(
        padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.green])),
        child: new Padding(
            padding:
                EdgeInsets.symmetric(vertical: px(30.0), horizontal: px(20.0)),
            child: Stack(children: <Widget>[
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: barElements),
              titleElement,
            ]))),
    preferredSize: Size.fromHeight(200),
  );
}
