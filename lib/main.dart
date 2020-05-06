import 'package:flutter/material.dart';
import 'package:zyh_flutter_router/mvc/mvc_location_api.dart';
import 'mvc/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Location.getKey(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainEntry(),
    );
  }
}
