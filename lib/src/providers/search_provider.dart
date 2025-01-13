import 'package:kitbe5997/src/providers/menu_provider.dart';

class _SearchProvider {
  _SearchProvider();

  Future<Map<dynamic, dynamic>> loadsearch(String query) async {
    List books = bookProvider.books;
    Map result = {};
    for (var b in books) {
      Map book = await bookProvider.loadChaptersOfBookName(b['name'].toString());
      for (var cap in book.entries) {
        List vers = cap.value.toList();
        for (Map v in vers) {
          if (v.values.first.toString().contains(query)) {
            result['${b['name'].toString()} ${cap.key.toString()}:${v.keys.first}'] =
                v.values.first;
          }
        }
      }
    }
    return result;
  }


  getTextIndex(String key) {
    String book = '';
    List numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    String cap = '';
    String vers = '';
    bool first = false;
    for (var i = 0; i < key.length; i++) {
      if (!numbers.contains(key[i]) & !key[i].contains(':')) {
        book += key[i];
      } else if (key[i].contains(':')) {
        first = true;
      } else if (!first) {
        cap += key[i];
      } else {
        vers += key[i];
      }
    }
    book = book.trim();

    return [book, cap, vers];
  }

}

final searchProvider = _SearchProvider();
