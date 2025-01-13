import 'package:flutter/material.dart';
import 'package:kitbe5997/src/providers/menu_provider.dart';

class ChapterPage extends StatefulWidget {
  const ChapterPage({super.key});

  @override
  ChapterPageState createState() => ChapterPageState();
}

class ChapterPageState extends State<ChapterPage> {
  @override
  Widget build(BuildContext context) {
    return _chapters(context);
  }

  Widget _chapters(BuildContext context) {
    return Scaffold(
      appBar: _chapterAppBar(context),
      body: _chapterNumbers(context),
    );
  }

  PreferredSizeWidget _chapterAppBar(BuildContext context) {
    String? chapter = ModalRoute.of(context)?.settings.arguments.toString();

    Widget dynamicTitle = chapter == null || chapter.isEmpty
        ? const Text("Cadena")
        : Text(
            chapter,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
          );

    return AppBar(
      title: dynamicTitle,
      centerTitle: true,
      backgroundColor: Colors.red[900],
      shadowColor: Colors.black54,
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      elevation: 30,
    );
  }

  Widget _chapterNumbers(BuildContext context) {
    String? name = ModalRoute.of(context)?.settings.arguments.toString();
    if (name != null) {
      return FutureBuilder(
          future: bookProvider.loadChaptersOfBookName(name),
          builder: (BuildContext context, snap) {
            return _retrieveChapterNumbers(context, snap.data);
          });
    }

    return const Text('No se pudo extraer los capitulos');
  }

  Widget _retrieveChapterNumbers(BuildContext context, Map? book) {
    if (book != null) {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5),
          itemCount: book.keys.length,
          itemBuilder: (BuildContext context, int index) {
            String key = book.keys.elementAt(index);
            return GridTile(
                child: Center(
              child: ElevatedButton(
                onPressed: () {
                  String? name =
                      ModalRoute.of(context)?.settings.arguments.toString();
                  if (name != null) {
                    Navigator.pushNamed(context, '/chapter/:$name/:$key', arguments: {
                      'book': book,
                      'name': name,
                      'chapter_text': book.values.toList()[index],
                      'chapter_number': book.keys.toList()[index],
                    });
                  }
                },
                style: ButtonStyle(
                    elevation: const WidgetStatePropertyAll(10),
                    backgroundColor: WidgetStatePropertyAll(Colors.red[900]),
                    padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 20, horizontal: 15)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: Text(
                  key,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ));
          });
    }

    return const Card();
  }
}
