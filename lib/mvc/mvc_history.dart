/*
 * 路由历史记录 
 */
class History {
  static const MAX_QUEUE_LENGTH = 20;
  // List<String> queue = new List<String>(MAX_QUEUE_LENGTH);
  List<String> queue = <String>[];
  int index = -1;
  void addQueue(String url) {
    queue.add(url);
    index += 1;
    if (index > MAX_QUEUE_LENGTH) {
      queue.removeAt(0);
      index = MAX_QUEUE_LENGTH;
    }
  }
  void go(int number, [dynamic params]) {
    int tempIndex = index + number;
    tempIndex = tempIndex.clamp(0, MAX_QUEUE_LENGTH);
    tempIndex = tempIndex.clamp(0, queue.length);
    if (queue.length < 1) return;
    String nowUrl = queue[tempIndex];
  }
}
