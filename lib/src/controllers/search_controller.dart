import 'package:get/get.dart';

class MySearchController extends GetxController {
  RxList<String> _items = RxList<String>();

  void addItem(String item) {
    _items.insert(0, item);
  }

  void setList(List<String> list) {
    _items = RxList(list);
    update();
  }

  void clear() {
    _items.clear();
    update();
  }

  void remove(String item) {
    _items.remove(item);
    update();
  }

  RxList<String> getItem({query}) {
    if (query != null) {
      return (query.isEmpty)
          ? _items
          : RxList(_items
              .where((i) => i.toLowerCase().startsWith(query.toLowerCase()))
              .toList());
    }
    return _items;
  }
}
