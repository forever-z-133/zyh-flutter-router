import 'package:flutter/material.dart';
import 'history.dart';

class Location {
  final BuildContext context;
  Location({this.context});
  reload() {}
  push(url, [params]) {
    history.add(url, params);
    this.render(url, params);
  }
  replace() {}
  back(params) {}
  getUrlTarget(url) {}
  render(url, [params]) {
    final target = getUrlTarget(url);
    Navigator.push(context, new MaterialPageRoute(builder: (context) => target.component()));
  }
}

Location location = new Location();
