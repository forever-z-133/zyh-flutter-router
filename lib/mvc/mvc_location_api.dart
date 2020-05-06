import 'package:flutter/material.dart';

import 'config.dart';
import 'mvc_history.dart';
import 'mvc_router_watcher.dart';

/*
 * 路由跳转
 */
class Location {
  String href;
  BuildContext context;
  RouterWatcher watcher = new RouterWatcher();
  History history = new History();
  Widget routeView;

  Location(this.context) {
  }

  // 跳转
  void push(String to, [dynamic params]) {
    renderRouter(to, 'PUSH', params, () {
      history.addQueue(to);
    });
  }

  // 删除本页历史然后跳转
  void replace(String to, [dynamic params]) {
    renderRouter(to, 'REPLACE', params, () {
      history.addQueue(to);
    });
  }

  // 后退一页
  void back() {
    history.go(-1);
  }

  // 前进一页
  void forward() {
    history.go(1);
  }

  // 刷新本页
  void reload(String to, [dynamic params]) {}

  void renderRouter(String url, String methodName, dynamic params, Function callback) {
    void next(String to) async {
      Map route = routeMap[to];
      Function component = route["component"];
      Function method = methodName == 'REPLACE' ? Navigator.pushReplacement : Navigator.push;
      print('跳页: $route');
      await method(context, MaterialPageRoute(builder: component));
    }
    watcher.beforeEach(url, href, next);
    watcher.afterEach(url, href);
    callback();
  }
}
