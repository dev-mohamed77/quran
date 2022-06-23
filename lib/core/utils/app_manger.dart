class AppManager {
  static List loopManager(List list) {
    List newList = [];
    for (var i = 0; i < list.length; i++) {
      newList.add(list[i]);
    }
    return newList;
  }
}
