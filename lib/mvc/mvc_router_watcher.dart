class RouterWatcher {
  void beforeEach(String to, String from, Function next) {
    next(to);
  }
  void afterEach(String to, String from) {}
  void beforeRouteEnter(String to, String from, next) {}
  void beforeRouteLeave(String to, String from, next) {}
}