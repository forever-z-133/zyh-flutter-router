/*
 * 路由历史记录 
 */
class History {
  static const MAX_QUEUE_LENGTH = 20;
  List<String> queue = new List<String>(MAX_QUEUE_LENGTH);
  int index = -1;

  /// 增加历史记录
  void addQueue(String url) {
    index += 1;
    if (index > MAX_QUEUE_LENGTH) {
      queue.removeAt(0);
    }
    index = index.clamp(0, MAX_QUEUE_LENGTH);
    queue[index] = url;
  }
  /// 移动历史记录指针
  void go(int number, [dynamic params]) {
    int tempIndex = index + number;
    tempIndex = tempIndex.clamp(-1, MAX_QUEUE_LENGTH);
    tempIndex = tempIndex.clamp(-1, queue.length);
    index = tempIndex;
  }
}
