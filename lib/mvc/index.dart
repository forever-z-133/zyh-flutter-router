import 'package:flutter/material.dart';
import 'package:zyh_flutter_router/tools/index.dart';

import 'mvc_location_api.dart';

/*
 * 应用主入口
 */
class MainEntry extends StatefulWidget {
  MainEntry({Key key}) : super(key: key);
  @override
  _MainEntryState createState() => _MainEntryState();
}

class _MainEntryState extends State<MainEntry> {
  @override
  void initState() {
    super.initState();
    setTimeout(() {
      location.replace("/home", 1);
    }, 1000);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Text('项目初始化...'),
      ),
    );
  }
}
