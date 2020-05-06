import 'dart:convert';
import 'package:flutter/services.dart';

class ChannelManager {
  static const String CHANNEL_NAME = "dingdong.flutter.common";
  static const MethodChannel _channel = const MethodChannel(CHANNEL_NAME);

  /// 测试连接
  static init() async {
    Map args = { "params": "test" };
    return await _channel.invokeMethod("hello", args);
  }

  /// 发起事件
  static trigger(String methodName, [dynamic params]) async {
    Map args = { "params": params };
    Map result = new Map();
    try {
      String res = await _channel.invokeMethod(methodName, args);
      result = jsonDecode(res);
    } catch(err) {
      result = { 'errMsg': '' };
    }
    return result;
  }
}
