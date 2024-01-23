// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GmailDialog extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  Future<void> _sendEmail(BuildContext context) async {
    final String url = 'https://formspree.io/f/xpzvqqre'; // Reemplaza con tu URL de Formspree

    final Map<String, String> formData = {
      'email': emailController.text,
      'message': bodyController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: formData,
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print('Correo enviado con éxito');
        // Puedes manejar la respuesta aquí si es necesario
      } else {
        print('Error al enviar el correo. Código de estado: ${response.statusCode}');
        // Puedes manejar el error aquí si es necesario
      }
    } catch (e) {
      print('Error al enviar el correo: $e');
    }
  }

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
          onPressed: () async {
            await _sendEmail(context);
           showDialog(
              context: context,
              useSafeArea: true,
              barrierDismissible: true,
              builder: (context) {
              return AlertDialog(
                 title: Icon(Icons.check_circle,color: Colors.green,),
                 content: Text('Enviado con Exito!',style:TextStyle(color: Colors.green,fontWeight: FontWeight.bold,),textAlign: TextAlign.center, ),
                 actions: [TextButton(onPressed: (){
                  Navigator.pop(context);
                 }, child: const Text('Cerrar'))],
                 );
               },
             );
          },
          child: Text('Enviar por Formspree'),
        ),
      ],
    );
  }
}
