import 'package:get/get.dart';

class MyBookController extends GetxController {
  RxMap _book = RxMap<String, RxMap<String, String>>();

  get book {
    return _book;
  }

  set book(newBook) {
    _book = newBook;
  }
}
