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


// 递归获取路由配置的映射
Map<String, Map> routeMap = new Map();

void loopForRouteMap(List configs, String rootUrl, bool isChild) {
  routeConfig.forEach((item) {
    String url = rootUrl + item['name'];
    url = url.replaceAll('//', '/');
    item['isChild'] = isChild;
    routeMap[url] = item;
    List children = item['children'];
    if (children != null) {
      loopForRouteMap(children, url, true);
    }
  });
}
