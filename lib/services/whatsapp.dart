import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class WhatsAppDialog extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  // void _sendMessage(BuildContext context) async {
  //   final String phoneNumber = phoneNumberController.text;
  //   final String message = messageController.text;

  //   if (phoneNumber.isEmpty) {
  //     // Validación: Asegúrate de que el número de teléfono no esté vacío
  //     print('Ingrese un número de teléfono.');
  //     return;
  //   }

  //   final Uri whatsappLaunchUri = Uri(
  //     scheme: 'https',
  //     path: 'wa/me/$phoneNumber',
  //     queryParameters: {'text': message},
  //   );

  //   if (await canLaunch(whatsappLaunchUri.toString())) {
  //     await launch(whatsappLaunchUri.toString());
  //   } else {
  //     // No se pudo abrir WhatsApp
  //     print('No se pudo abrir WhatsApp');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enviar Mensaje por WhatsApp'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(labelText: 'Número de Teléfono'),
          ),
          TextField(
            controller: messageController,
            maxLines: 5, // Configura el número máximo de líneas
            decoration: InputDecoration(labelText: 'Mensaje'),
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
       //     _sendMessage(context);
          },
          child: Text('Enviar por WhatsApp'),
        ),
      ],
    );
  }
}
