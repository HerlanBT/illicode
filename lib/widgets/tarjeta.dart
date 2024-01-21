import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Tarjeta extends StatefulWidget {
  final String titulo;
  final String contenido;

  Tarjeta({required this.titulo, required this.contenido});

  @override
  _TarjetaState createState() => _TarjetaState();
}

class _TarjetaState extends State<Tarjeta> {
  bool isHovered = false;
  late Timer colorTimer;
  late Color borderColor;

  @override
  void initState() {
    super.initState();
    borderColor = Colors.transparent;
    colorTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        borderColor = Colors
            .primaries[Random().nextInt(Colors.primaries.length)]; // Colores aleatorios de Material
      });
    });
  }

  void _handleHover(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  @override
  void dispose() {
    colorTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: isHovered ? 220.0 : 210.0,
          width: isHovered ? 310.0 : 290.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 2, 1, 22),
                Color.fromARGB(255, 2, 0, 126),
              ],
            ),
            border: Border.all(
              color: isHovered ? borderColor : Colors.transparent ,
              width: 2.0,
            ),
          ),
          child: GestureDetector(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.titulo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        widget.contenido,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
