import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitbe5997/src/controllers/search_controller.dart';
import 'package:kitbe5997/src/providers/menu_provider.dart';
import 'package:kitbe5997/src/providers/search_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextSearch extends SearchDelegate {
  MySearchController c = Get.find<MySearchController>();
  @override
  String get searchFieldLabel => 'Buscar';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    _saveSearchHistory(query);

    return FutureBuilder(
        future: searchProvider.loadsearch(query),
        builder: (BuildContext context,
            AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
          if (snapshot.hasData) {
            Map data = snapshot.data!;

            if (data.isNotEmpty) {
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: false,
                  title:
                      Text('Número de resultados: ${data.length.toString()}'),
                ),
                body: Container(
                  padding: const EdgeInsets.all(25),
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          title: Column(
                            children: [
                              Text('${data.keys.elementAt(index)}'),
                              Text(
                                '${data.values.elementAt(index)}',
                                textAlign: TextAlign.justify,
                              )
                            ],
                          ),
                          onTap: () async {
                            String key = data.keys.elementAt(index);
                            List lista = searchProvider.getTextIndex(key);

                            Map book = await bookProvider
                                .loadChaptersOfBookName(lista[0]);
                            print(book);
                            Navigator.pushNamed(
                                context, '/chapter/:${lista[0]}/:${book.keys
                                      .toList()[int.parse(lista[1]) - 1]}',
                                arguments: {
                                  'book': book,
                                  'name': lista[0],
                                  'chapter_text': book.values
                                      .toList()[int.parse(lista[1]) - 1],
                                  'chapter_number': book.keys
                                      .toList()[int.parse(lista[1]) - 1],
                                });
                          },
                        );
                      }),
                ),
              );
            }
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.red[900],
            ));
          }

          return const Center(
            child: Text(
              'No hay coincidencias',
              style: TextStyle(fontSize: 20),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _getSearchHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Container();
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text(''));
        } else {
          return GetBuilder<MySearchController>(builder: (c) {
            return ListView.builder(
              itemCount: c.getItem(query: query).length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(c.getItem(query: query)[index]),
                  leading: const Icon(Icons.history),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  onTap: () {
                    query = c.getItem(query: query)[index];
                  },
                  trailing: IconButton(
                      onPressed: () async {
                        await _deleteSearchEntry(
                            c.getItem(query: query)[index]);
                      },
                      icon: const Icon(Icons.delete_forever)),
                );
              },
            );
          });
        }
      },
    );
  }

  _saveSearchHistory(String query) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    c.setList(prefs.getStringList('search_history')!.reversed.toList());
    /* c.items =
        RxList(prefs.getStringList('search_history')?.reversed.toList() ?? []); */
    if (c.getItem().toList().isNotEmpty) {
      if (c.getItem().toList().any((element) => element == query)) {
        c.remove(query);
      }
      c.addItem(query);
    } else {
      c.addItem(query);
    }
    await prefs.setStringList('search_history', c.getItem().reversed.toList());
  }

  Future<List<String>> _getSearchHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    c.setList(prefs.getStringList('search_history')?.reversed.toList() ?? []);

    return c.getItem();
  }

  _deleteSearchEntry(String query) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    c.setList(prefs.getStringList('search_history')?.reversed.toList() ?? []);
    c.remove(query);
    await prefs.setStringList('search_history', c.getItem().reversed.toList());
  }
}
