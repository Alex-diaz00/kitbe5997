import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitbe5997/src/controllers/search_controller.dart';
import 'src/app.dart';

void main() async {
  Get.lazyPut<MySearchController>(() => MySearchController());
  runApp(const MyApp());
}
