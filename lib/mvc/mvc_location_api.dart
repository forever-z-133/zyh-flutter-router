import 'package:flutter/material.dart';

import 'config.dart';
import 'mvc_history.dart';
import 'mvc_router_watcher.dart';

/*
 * 路由跳转
 */
class Location {
  String href;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // BuildContext context;
  RouterWatcher watcher = new RouterWatcher();
  History history = new History();
  Widget routeView;

  static GlobalKey<NavigatorState> getKey() {
    return navigatorKey;
  }

  // Location(this.context);

  ///获取到DB的实例对象
  static Location _instance;
  static Location getInstance() {
    if(_instance == null) {
      _instance = new Location();
    }
    return _instance;
  }

  /// 跳转
  void push(String to, [dynamic params]) {
    updateRoute('PUSH', to, params, () {
      history.go(history.index + 1, to);
    });
  }

  /// 删除本页历史然后跳转
  void replace(String to, [dynamic params]) {
    updateRoute('REPLACE', to, params, () {
      history.go(history.index, to);
    });
  }

  /// 后退一页
  void back() {
    String to = history.queue[history.index - 1];
    updateRoute('BACK', to, null, () {
      history.go(history.index - 1, to);
    });
  }

  /// 实际跳页逻辑
  void updateRoute(String methodName, String to, dynamic params, Function callback) {
    Function next = update(methodName, params, callback);
    watcher.beforeEach(to, href, next);
  }
  Function update(String methodName, dynamic params, Function callback) {
    return (to) async {
      Map route = routeMap[to];
      Function component = route["component"];
      Function method;
      if (methodName == 'PUSH') {
        method = navigatorKey.currentState.push;
      } else if (methodName == 'REPLACE') {
        method = navigatorKey.currentState.pushReplacement;
      } else if (methodName == 'BACK') {
        method = navigatorKey.currentState.pop;
      }
      
      method(MaterialPageRoute(builder: component));
      print('$href 到 $to');
      watcher.afterEach(to, href);
      callback();
      href = to;
    };
  }
}

Location location = new Location();