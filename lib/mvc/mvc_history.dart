/*
 * 路由历史记录 
 */
class History {
  static const MAX_QUEUE_LENGTH = 20;
  List<String> queue = new List<String>(MAX_QUEUE_LENGTH);
  int index = -1;
  
  /// 移动历史记录指针
  void go(int newIndex, String url, [dynamic params]) {
    newIndex = newIndex.clamp(0, MAX_QUEUE_LENGTH);
    newIndex = newIndex.clamp(0, queue.length);
    index = newIndex;
    queue[index] = url;
  }
}
