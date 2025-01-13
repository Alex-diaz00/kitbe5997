import 'package:get/get.dart';
import 'package:kitbe5997/src/pages/about_page.dart';
import 'package:kitbe5997/src/pages/chapter_page.dart';
import 'package:kitbe5997/src/pages/contact_page.dart';
import 'package:kitbe5997/src/pages/home_page.dart';
import 'package:kitbe5997/src/pages/introduction_page.dart';
import 'package:kitbe5997/src/pages/verse_page.dart';

List<GetPage> getAppRoutes() {
  return [
    GetPage(name: '/', page: () => const HomePage()),
    GetPage(name: '/chapter', page: () => const ChapterPage()),
    GetPage(name: '/chapter/:book_name', page: () => const ChapterPage()),
    GetPage(name: '/chapter/:book_name/:number', page: () => const VersePage()),
    GetPage(name: '/intro', page: () => const IntroductionPage()),
    GetPage(name: '/about', page: () => const AboutPage()),
    GetPage(name: '/contact', page: () => const ContactPage()),
  ];
}
