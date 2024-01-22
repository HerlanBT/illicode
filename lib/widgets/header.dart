// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'alertadiag.dart';
import 'textos.dart';



class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      bool aux=  (MediaQuery.of(context).size.width < 600); 
    return AppBar(
      backgroundColor: Colors.transparent,
    
      iconTheme: const IconThemeData(color: Colors.black),
      title: Container(
        height: 61,
        padding: EdgeInsets.symmetric(horizontal: 5),
        
        child: Row(
          children: [
            
             Image.asset('images/logofijo.png',width:aux? 50:200,height:aux? 50:100,),
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
                    onTap: () {
                        Navigator.pushReplacementNamed(context, '/');
                    },
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
                    onTap: (){
 DialogoAlerta(context, 'Nosotros', nosotros);
                    },
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
                    onTap: () {
                       Redes(context);
                    },
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
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
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
                      titulo: 'NOSOTROS',
                      contenido: nosotros,
                    ),
                    IconText(
                      text: 'CONTACTO',
                      Icono: Icons.phone,
                      contenido: '',
                      titulo: 'CONTACTO',
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
    Navigator.pushReplacementNamed(context, '/');
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
            color: _isHovered ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isHovered ? Color.fromARGB(255, 21, 0, 77) : Colors.white,
            ),
          ),
          child: TextButton.icon(
            onPressed: () {
              print(widget.titulo);
              if (widget.titulo=='CONTACTO') {
                  Redes(context);
                
              } else {
              
                  DialogoAlerta(context, widget.titulo, widget.contenido);
              }
            

            },
            icon: Icon(
              widget.Icono,
              color: _isHovered ? Color.fromARGB(255, 21, 0, 77) : Colors.white,
            ),
            label: Text(
              widget.text,
              style: GoogleFonts.andika(
                color:
                    _isHovered ? Color.fromARGB(255, 21, 0, 77) : Colors.white,
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
