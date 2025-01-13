import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body());
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        'Introducción',
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
              '"Traducción Fidedigna"',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    'Esta Traducción es una Restauración más fidedigna de otras traducciones restauradas con el fin de quitar TODA  añadidura UNICISTA, TRINITARISTA Y ERRORES DE TRADUCCIÓN DE CRISTIANOS QUE SE DEJARON INFLUENCIAR POR SUS IDEAS PRECONCEBIDAS'),
                SizedBox(
                  height: 20,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    'El trabajo para tener lista esta Escritura ha durado 7 años.'),
                SizedBox(
                  height: 20,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    'Para esta publicación única de LA TANAJ Y BRIT JADASHÁ HA TORAH HA YAHWEH he usado los textos Masoréticos como textos bases para el Tanaj y Manuscrito de las Cartas de los Shelujim junto a los Escritos de los Padres Apostólicos. También cotejé la Peshita del siglo II y la Biblia de Jerusalém en sus versiones más antiguas. Entonces procedí a corregir las redacciones obvias y vergonzosamente manipuladas por los editores Masoréticos hebreos, cristianos y mesiánicos y otros actuales. Además, he reinsertado el nombre Verdadero en estas Fuentes fundamentales.'),
                SizedBox(
                  height: 20,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    'Después de considerar en TEFILAT (Oración) y estudio, y siguiendo siempre la Guía del Ruaj HaKodesh en cada revisión minuciosa, he usado fuentes claves tales como Los Manuscritos del Mar Muerto (El Qumrám).'),
                SizedBox(
                  height: 20,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    'La mayoría de las fuentes consultadas han sido Semíticas, puesto que creo que fueron inspiradas y escritas en las lenguas semíticas tales como el hebreo y el arameo.'),
                SizedBox(
                  height: 20,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.w600),
                    'LA TIFERET (Gloria y Honra) DE ESTA TRADUCCIÓN ES A YAHWEH'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    'Mi propósito en publicar LA KITBÉ YISRAELITA RESTAURADA 5997, es dar a todos los benei Yisrael, la oportunidad de seguir radicalmente la Guía de Yahweh para que, en este último tiempo, todo Yisrael tuviera en sus manos una traducción FINAL que ante todo y sobre todo, levanta y proclama El Shem (Nombre) Verdadero de Yahweh como apareció originalmente en el Primer Brit (Pacto) casi 7000 veces en las fuentes históricas fiables Semíticas. Inserciones adicionales fueron basadas sobre la consistencia e inmutabilidad del Abba Celestial, cuyo Nombre no cambia (Shemot 3:14-15).'),
                SizedBox(
                  height: 20,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    'Para el Brit Jadashá (Nuevo Pacto) he incluido el Nombre verdadero del Mashiaj Yahshua que fue cambiado a nombres errados y que no correspondían a su esencia hebrea, ya que los nombres propios hebreos no se pueden traducir a ninguna lengua.'),
                SizedBox(
                  height: 20,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.w600),
                    'SEFER INCLUIDOS Y ACEPTADOS COMO INSPIRADOS'),
                SizedBox(
                  height: 10,
                ),
                Text('- Yanokj (Se ha incluido al final de Devarim)'),
                Text('- Yashar (Se ha incluido después de Yanokj)'),
                Text('- Jubileo (Se ha incluido después de Yahoshua)'),
                Text('- Los dichos de Yahshua (Tomás)'),
                Text('- Clemente de Roma (Discípulo de Kefa)'),
                Text('- Sefer a la Kajal de Filadelfia en el tiempo del fin'),
                Text('- Carta a Laodicea'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
