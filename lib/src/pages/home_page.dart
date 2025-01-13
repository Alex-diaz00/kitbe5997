import 'package:flutter/material.dart';
import 'package:kitbe5997/src/providers/menu_provider.dart';
import 'package:kitbe5997/src/search/search_delegate.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kitbé HaKodesh",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        shadowColor: Colors.black54,
        elevation: 30,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: TextSearch());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      drawer: _drawer(context),
      body: _retrieveList(),
    );
  }

  Widget _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red[900],
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                runAlignment: WrapAlignment.center,
                children: <Widget>[
                  Container(
                      width: 90,
                      height: 90,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const FadeInImage(
                          fit: BoxFit.cover,
                          placeholder:
                              AssetImage("assets/images/icon_kitbe.jpeg"),
                          image: AssetImage("assets/images/icon_kitbe.jpeg"))),
                  const Text(
                    "Kitbé HaKodesh 5997",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )),
          _drawerListTile(
              context: context,
              name: 'Introducción',
              route: '/intro',
              icon: const Icon(Icons.book)),
          _drawerListTile(
              context: context,
              name: 'Sobre la app',
              route: '/about',
              icon: const Icon(Icons.adb_rounded)),
          _drawerListTile(
              context: context,
              name: 'Contacto',
              route: '/contact',
              icon: const Icon(Icons.contacts_sharp)),
        ],
      ),
    );
  }

  Widget _drawerListTile(
      {required BuildContext context,
      required String name,
      required String route,
      required Icon icon}) {
    return ListTile(
      leading: icon,
      title: Text(name),
      contentPadding: const EdgeInsets.symmetric(horizontal: 25),
      horizontalTitleGap: 15,
      minVerticalPadding: 10,
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }

  Widget _retrieveList() {
    return FutureBuilder(
        future: bookProvider.loadBooksName(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          return ListView(
            children: _retrieveBookNames(context, snap.data),
          );
        });
  }

  List<Widget> _retrieveBookNames(BuildContext context, List<dynamic>? data) {
    List<Widget> tileItems = [];
    if (data != null) {
      tileItems.add(const Divider(
        height: 3,
        color: Colors.red,
      ));
      for (var book in data) {
        tileItems.add(ListTile(
          title: Text(
            book['name'],
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          subtitle: Center(
            child: Text(book['2nd_name']),
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, '/chapter', arguments: book['name']);
          },
        ));
        tileItems.add(const Divider(
          color: Colors.red,
        ));
      }
    }

    return tileItems;
  }
}
