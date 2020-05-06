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
  Location location;

  @override
  void initState() {
    super.initState();
    print('show');
    setTimeout(() {
      location.replace("/home", 1);
    }, 1000);
  }

  @override
  Widget build(BuildContext context) {
    location = new Location(context);
    if (location.routeView != null) {
      return location.routeView;
    }
    return new Container(
      child: new Center(
        child: new Text('项目初始化...'),
      ),
    );
  }
}
