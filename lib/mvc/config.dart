import 'pages/about.dart';
import 'pages/home.dart';

List<Map<String, dynamic>> routeConfig = [
  {
    "name": "/home",
    "component": (context) => PageHome(),
  },
  {
    "name": "/about",
    "component": (context) => PageAbout(),
  },
];

/// 递归获取路由配置的映射
/// 如 {"/home":{}, "/about": {}}
Map<String, Map<String, dynamic>> loopForRouteMap(List configs, String rootUrl, [routeMap]) {
  bool isChild = routeMap != null;
  Map<String, Map<String, dynamic>> tempRouteMap = routeMap ?? new Map();
  routeConfig.forEach((Map<String, dynamic> item) {
    String url = rootUrl + item['name'];
    url = url.replaceAll('//', '/');
    if (isChild) {
      item['parent'] = rootUrl;
      item['isChild'] = isChild;
    }
    tempRouteMap[url] = item;
    List children = item['children'];
    if (children != null) {
      tempRouteMap = loopForRouteMap(children, url, tempRouteMap);
    }
  });
  return tempRouteMap;
}

/// 路由配置的映射
Map<String, Map> routeMap = loopForRouteMap(routeConfig, "/");
