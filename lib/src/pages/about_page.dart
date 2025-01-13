import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body());
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        'Sobre la app',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      centerTitle: true,
      backgroundColor: Colors.red[900],
      shadowColor: Colors.black54,
      elevation: 30,
    );
  }

  Widget _body() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Center(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: const [
            Text(
              'Objetivo',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    'Esta aplicación móvil ha sido creada con el objetivo de tener en cualquier lugar que te encuentres, una escritura fidedigna a mano, como lo es la versión Kitbé HaKodesh 5997. Su simplicidad y rendimiento intenta brindar una experiencia de usuario lo más agradable posible.'),
                SizedBox(
                  height: 20,
                ),
                Text(
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                    'Características y funcionalidades:'),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(Icons.touch_app),
                  title: Text(
                      'Selección de libros y capítulos a través de listas para su fácil acceso'),
                ),
                ListTile(
                  leading: Text(
                    'Aa',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  title: Text(
                      'Tamaño de letra de los versículos ajustable a su gusto'),
                ),
                ListTile(
                  leading: Icon(Icons.copy),
                  title: Text(
                      'Permite copiar todos los versículos que seleccione dentro de un capítulo'),
                ),
                ListTile(
                  leading: Icon(Icons.search),
                  title: Text(
                      'Búsqueda de palabras y frases en los versículos de toda la escritura'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
