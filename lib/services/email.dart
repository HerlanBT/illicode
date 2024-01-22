import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';

class GmailDialog extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  // void _sendEmail(BuildContext context) async {
  //   final String receiverEmail = 'ballon777herlanturpo@gmail.com';
  //   final String subject = 'Asunto del correo';
  //   final String body = bodyController.text;

  //   final smtpServer = gmail('YOUR_EMAIL@gmail.com', 'YOUR_PASSWORD');

  //   final message = Message()
  //     ..from = Address('YOUR_EMAIL@gmail.com', 'Your Name')
  //     ..recipients.add(receiverEmail)
  //     ..subject = subject
  //     ..text = body;

  //   try {
  //     await send(message, smtpServer);
  //     print('Correo enviado con éxito');
  //   } catch (e) {
  //     print('Error al enviar el correo: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enviar Correo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Correo Electrónico'),
          ),
          TextField(
            controller: bodyController,
            decoration: InputDecoration(labelText: 'Cuerpo del Correo'),
            maxLines: 5,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
       //     _sendEmail(context);
          },
          child: Text('Enviar por Gmail'),
        ),
      ],
    );
  }
}
