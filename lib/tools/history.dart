class History {
  List log = new List();
  int current = 0;
  int id = 0;
  back() {}
  forward() {}
  go() {}
  pushState() {}
  replaceState() {}
  add(url, params) {
    int uid = id + 1;
    log.add({ uid: uid, url: url, params: params });
  }
}

History history = new History();
