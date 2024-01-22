// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Tarjeta2 extends StatefulWidget {

  final String contenido;

  Tarjeta2({ required this.contenido});

  @override
  _Tarjeta2State createState() => _Tarjeta2State();
}

class _Tarjeta2State extends State<Tarjeta2> {
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
          height: isHovered ? 120.0 : 100.0,
          width: isHovered ? 310.0 : 300.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 2, 1, 22),
                Color.fromARGB(255, 0, 0, 0),
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
