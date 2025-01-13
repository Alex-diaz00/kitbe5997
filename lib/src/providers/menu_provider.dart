import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _BookProvider {
  List<dynamic> books = [];
  Map _book = {};
  _BookProvider() {
    loadBooksName();
  }

  Future<List<dynamic>> loadBooksName() async {
    final response = await rootBundle.loadString('data/books_dict.json');

    Map mapJson = json.decode(response);
    books = mapJson.values.toList();
    return books;
  }

  Future<Map<dynamic, dynamic>> loadChaptersOfBookName(String name) async {
    final response = await rootBundle.loadString('data/$name.json');
    Map mapJson = json.decode(response);
    _book = mapJson;
    return _book;
  }
  /* Future<Map<String, dynamic>> loadAllBooks() async {
    book_ditc = 
  } */
}

final bookProvider = _BookProvider();
