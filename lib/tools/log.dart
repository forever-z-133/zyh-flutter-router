/// # 埋点记录
/// 对接友盟 https://www.umeng.com/analytics
/// 使用 lcfarm_flutter_umeng 插件 https://pub.dev/packages/lcfarm_flutter_umeng

enum LogType {
  SYSTEM, // 系统信息记录
  NET, // 请求记录
  EVENT, // 事件记录
  ACTION, // 行为记录
  PAGE, // 跳页记录
  CUSTOM // 其他
}

class Log {
  init() {
  }

  add(LogType type, time, params) {}
  ajax() {}
}
