import 'dart:convert';
import 'dart:io';

Object ajax(url, method, params) async {
  var httpClient = new HttpClient();
  String baseUrl = 'example.com';
  Map params = {'param1': '42', 'param2': 'foo'};
  var uri = new Uri.http(baseUrl, '/path1/path2', params);
  String result;
  try {
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      var json = await response.transform(utf8.decoder).join();
      var data = jsonDecode(json);
      result = data['origin'];
    } else {
      result = 'Error getting IP address:\nHttp status ${response.statusCode}';
    }
  } catch (exception) {
    result = 'Failed getting IP address';
  }
  return result;
}

