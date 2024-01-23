// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/email.dart';
// import '../services/whatsapp.dart';

Future<void> DialogoAlerta(
    BuildContext context, String title, String content) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // El usuario debe tocar el botón para cerrar
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content,textAlign: TextAlign.justify,),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}

Future<void> Redes(BuildContext context) async {
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo lanzar la URL $url';
    }
  }

  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Nuestras Redes Son:'),
        content: Container(
          height: 300,
          child: Column(
            children: [
              FilledButton(
                onPressed: () async {
                  await _launchURL('https://www.youtube.com');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 250, 2, 2), // Cambiar el color de fondo aquí
                ),
                child: const Text('Youtube'),
              ),
              SizedBox(height: 20,),
              FilledButton(
                onPressed: () async {
                  await _launchURL('https://www.facebook.com');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 27, 2, 250), // Cambiar el color de fondo aquí
                ),
                child: const Text('Facebook'),
              ),
               SizedBox(height: 20,),
              FilledButton(
                onPressed: () async {
                  await _launchURL('https://www.tiktok.com');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 0, 0, 0), // Cambiar el color de fondo aquí
                ),
                child: const Text('Tiktok'),
              ),
               SizedBox(height: 20,),
              // FilledButton(
              //   onPressed: () async {
              //     await  showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return WhatsAppDialog();
              //   },
              // );
              //   },
              //   style: ElevatedButton.styleFrom(
              //     primary: Color.fromARGB(255, 1, 104, 32), // Cambiar el color de fondo aquí
              //   ),
              //   child: const Text('Whatsapp'),
              // ),
              //  SizedBox(height: 20,),
              FilledButton(
                onPressed: () async {
                  await  showDialog(
                context: context,
                builder: (BuildContext context) {
                  return GmailDialog();
                },
              );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 167, 94, 0), // Cambiar el color de fondo aquí
                ),
                child: const Text('Gmail'),
              ),
               SizedBox(height: 20,),
              FilledButton(
                onPressed: () async {
                  await _launchURL('https://www.twitter.com');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 0, 0, 0), // Cambiar el color de fondo aquí
                ),
                child: const Text('X/Twitter'),
              ),
            
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar'),
          ),
        ],
      );
    },
  );
}
