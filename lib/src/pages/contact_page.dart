import 'package:flutter/material.dart';
import 'package:kitbe5997/src/widgets/profile_card_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});
  final String _name = 'Alexis Díaz Milián';
  final String _phoneNumber = '+53 58759283';
  final String _email =
      'alexisdiazmilian00@gmail.com'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body(context));
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        'Desarrollador',
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

  Widget _body(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ProfileCard(
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.2),
                width: size.width * 0.95,
                height: size.height * 0.35,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Card(
                  elevation: 20,
                  clipBehavior: Clip.antiAlias,
                  child: ListView(
                    children: [
                      Center(
                        child: Text(
                          _name,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: Text(
                          _email,
                          style: const TextStyle(fontSize: 14),
                        ),
                        onTap: () async {
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: _email,
                          );

                          if (await canLaunchUrl(emailLaunchUri)) {
                            await launchUrl(emailLaunchUri);
                          } else {
                            throw 'No se puede abrir el correo electrónico.';
                          }
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.phone),
                        title: Text(_phoneNumber),
                        onTap: () async {
                          Uri phoneCall =
                              Uri(scheme: 'tel', path: _phoneNumber);
                          if (await canLaunchUrl(phoneCall)) {
                            await launchUrl(phoneCall);
                          } else {
                            throw 'No se puede llamar.';
                          }
                        },
                      ),
                      ListTile(
                        leading: const FaIcon(FontAwesomeIcons.whatsapp),
                        title: const Text('Contactar por Whatsapp'),
                        onTap: () async {
                          Uri phoneCall =
                              Uri.parse('https://wa.me/+5358759283');
                          if (await canLaunchUrl(phoneCall)) {
                            await launchUrl(phoneCall);
                          } else {
                            throw 'No se puede contactar.';
                          }
                        },
                      ),
                      ListTile(
                        leading: const FaIcon(FontAwesomeIcons.linkedin),
                        title: const Text('Contactar por LinkedIn'),
                        onTap: () async {
                          Uri linkedIn = Uri.parse(
                              'https://www.linkedin.com/in/alexis-diaz-mili%C3%A1n-79093a266');
                          if (await canLaunchUrl(linkedIn)) {
                            await launchUrl(linkedIn);
                          } else {
                            throw 'No se puede contactar.';
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
