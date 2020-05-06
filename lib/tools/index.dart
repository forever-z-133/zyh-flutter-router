import 'dart:ui';

// 响应式单位
flexible(remRatio) {
  double winW = window.physicalSize.width / window.devicePixelRatio;
  double rem = winW / remRatio;
  return (num) => num * rem;
}

// 若设计稿为 750，则 px(750) 代表全屏
dynamic px = flexible(750);

/// 仿 js 的 Array.some 方法
bool arraySome(List arr, Function func) {
  for (var item in arr) {
    bool isTrue = func(item);
    if (isTrue) return true;
  }
  return false;
}

// 睡眠
Future sleep(int delay) async {
  return Future.delayed(Duration(milliseconds: delay));
}

// 仿 js 的 setTimeout
void setTimeout(Function callback, int delay) async {
  await sleep(delay);
  callback();
}

/// 处理多个请求同时运行的情况。
/// 优于逐个请求，也避免 for 多个问题，用 Future.any 报错难查，故而使用此方案
void forEachAsync(List data, Function func, [Map options]) {
  options = options ?? {};
  int times = options['number'] ?? 5;
  int maxTimes = times.clamp(1, 8); // 最大线程数 8，默认为 5
  int total = data.length - 1;
  List result = new List(data.length);

  int restQueue = maxTimes; // 剩余队列数
  int started = 0; // 已发起
  int loaded = 0; // 已完成

  // 全部运行完成
  void finish(result) {
    if (options['finish'] != null) {
      options['finish'](result);
    }
  }

  // 队列空闲则递归
  dynamic loop(int index) {
    void next(res) {
      restQueue++;
      result.fillRange(index, index + 1, res);
      if (++loaded > total) finish(result);
      else loop(++started);
    }
    if (index > total) return null;
    dynamic item = data[index];
    func(index, item, next);
    if (--restQueue > 0) loop(++started);
  }

  loop(0);
}
