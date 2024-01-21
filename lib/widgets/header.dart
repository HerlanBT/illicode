// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'alertadiag.dart';



class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
    
      iconTheme: const IconThemeData(color: Colors.black),
      title: Container(
        height: 61,
        padding: EdgeInsets.symmetric(horizontal: 5),
        
        child: Row(
          children: [
            
             Image.asset('logofijo.png',width: 60,height: 60,),
            const SizedBox(width: 8),
            Expanded(
              child: HoverText(
                text: 'Illimani Code',
              ),
            ),
          ],
        ),
      ),
      actions: [
        Builder(
          builder: (BuildContext context) {
            if (MediaQuery.of(context).size.width < 600) {
              return PopupMenuButton<int>(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: const Row(
                      children: [
                        Icon(Icons.home),
                        SizedBox(width: 10),
                        Text("Inicio"),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: const Row(
                      children: [
                        Icon(Icons.people,),
                        SizedBox(width: 10),
                        Text("NOSOTROS"),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: const Row(
                      children: [
                        Icon(Icons.phone,),
                        SizedBox(width: 10),
                        Text("CONTACTO"),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Container(
                child: Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      label: Text(
                        'INICIO',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    IconText(
                      text: 'NOSOTROS',
                      Icono: Icons.people,
                      titulo: 'hola',
                      contenido: 'xxxxdddddd',
                    ),
                    IconText(
                      text: 'CONTACTO',
                      Icono: Icons.phone,
                      contenido: '',
                      titulo: '',
                    )
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}


class HoverText extends StatefulWidget {
  final String text;

  const HoverText({Key? key, required this.text}) : super(key: key);

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _changeHover(true),
      onExit: (_) => _changeHover(false),
      child: GestureDetector(
        onTap: () {
          // Puedes agregar acciones adicionales al hacer clic aquí
          print('Text clicked!');
        },
        child: Text(
          widget.text,
          style: GoogleFonts.andika(
            color: _isHovered ? Colors.black : Colors.black,
            fontSize: _isHovered ? 50.0 : 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _changeHover(bool value) {
    setState(() {
      _isHovered = value;
    });
  }
}

class IconText extends StatefulWidget {
  final String text;
  final String titulo;
  final String contenido;
  final IconData Icono;

  const IconText({Key? key, required this.text, required this.Icono, required this.titulo, required this.contenido})
      : super(key: key);

  @override
  _IconTextState createState() => _IconTextState();
}

class _IconTextState extends State<IconText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _changeHover(true),
      onExit: (_) => _changeHover(false),
      child: GestureDetector(
        onTap: () {

        },
        child: Container(
          decoration: BoxDecoration(
            color: _isHovered ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isHovered ? Color.fromARGB(255, 21, 0, 77) : Colors.white,
            ),
          ),
          child: TextButton.icon(
            onPressed: () {
              DialogoAlerta(context, widget.titulo, widget.contenido);

            },
            icon: Icon(
              widget.Icono,
              color: _isHovered ? Color.fromARGB(255, 21, 0, 77) : Colors.black,
            ),
            label: Text(
              widget.text,
              style: GoogleFonts.andika(
                color:
                    _isHovered ? Color.fromARGB(255, 21, 0, 77) : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _changeHover(bool value) {
    setState(() {
      _isHovered = value;
    });
  }
}
