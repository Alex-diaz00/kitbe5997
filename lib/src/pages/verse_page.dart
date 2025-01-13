import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VersePage extends StatefulWidget {
  const VersePage({super.key});

  @override
  VersePageState createState() => VersePageState();
}

class VersePageState extends State<VersePage> {
  double _fontSize = 15;
  final ScrollController _scrollController = ScrollController();
  final List<bool> _selected = List.generate(200, (i) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _verseAppBar(context),
      backgroundColor: Colors.white,
      body: _getVerses(context),
      bottomNavigationBar: _myButtonBar(context),
    );
  }

  PreferredSizeWidget _verseAppBar(BuildContext context) {
    Map? arguments = ModalRoute.of(context)?.settings.arguments as Map;
    Widget dynamicTitle = arguments.isEmpty
        ? const Text("Cadena")
        : Text(
            '${arguments['name']} - ${arguments['chapter_number']}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
          );

    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.red[900],
      shadowColor: Colors.black54,
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      elevation: 30,
      title: dynamicTitle,
    );
  }

  Widget _getVerses(BuildContext context) {
    Map? arguments = ModalRoute.of(context)?.settings.arguments as Map;

    return ListView.builder(
        controller: _scrollController,
        itemCount: arguments['chapter_text'].length,
        itemBuilder: (BuildContext context, int index) {
          final Map versemap = arguments['chapter_text'][index];
          String verse = versemap.values.first;

          return ListTile(
            tileColor: _selected[index] ? Colors.blueGrey[200] : Colors.white,
            shape: const Border(bottom: BorderSide(width: 1)),
            textColor: Colors.black,
            onTap: () {
              setState(() => _selected[index] = !_selected[index]);
            },
            onLongPress: () {},
            titleAlignment: ListTileTitleAlignment.top,
            titleTextStyle: TextStyle(fontSize: _fontSize),
            leadingAndTrailingTextStyle: const TextStyle(fontSize: 15),
            leading: Text('${index + 1}'),
            horizontalTitleGap: 0,
            minVerticalPadding: 5,
            title: SelectableText(verse),
          );
        });
  }

  Widget _myButtonBar(BuildContext context) {
    Map? arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return Container(
      color: Colors.red[900],
      height: 60,
      child: ButtonBar(
        children: [
          Container(
            child: _selected.contains(true)
                ? TextButton(
                    onPressed: () async {
                      List<int> indicesTrue =
                          _selected.asMap().entries.where((entry) {
                        return entry.value;
                      }).map((entry) {
                        return entry.key;
                      }).toList();

                      String text =
                          'Kitbe HaKodesh 5997\n${arguments['name']} - ${arguments['chapter_number']}\n';

                      for (var i = 0; i < indicesTrue.length; i++) {
                        final Map versemap =
                            arguments['chapter_text'][indicesTrue[i]];
                        String verse = versemap.values.first;
                        text += '\n${indicesTrue[i] + 1} $verse';
                      }

                      await Clipboard.setData(ClipboardData(text: text));
                      _selected.fillRange(0, _selected.length, false);
                      setState(() {});
                    },
                    child: const Text(
                      "Copiar texto",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                : Container(),
          ),
          TextButton(
            onPressed: () {
              if (_fontSize != 30) {
                _fontSize += 5;
              } else {
                _fontSize = 15;
              }
              setState(() {});
            },
            child: const Tooltip(
                message: "Tamaño de letra",
                child: Text(
                  "Aa",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
