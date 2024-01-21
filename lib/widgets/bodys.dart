import 'package:flutter/material.dart';

import 'tarjeta.dart';

 SingleChildScrollView Body1(String imagennormal,String titulo,String contenido,String imagencirc) {
    
    return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagennormal,
                            width: 400.0, // Ajusta el ancho según tus necesidades
                        height: 210.0,
                        fit: BoxFit.cover,
                      ),
                      Tarjeta(
                        titulo: titulo,
                        contenido: contenido,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ClipOval(
                        child: Image.asset(
                          imagencirc,
                          width:
                              180.0, // Ajusta el ancho según tus necesidades
                          height:
                              180.0, // Ajusta la altura según tus necesidades
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
  }

  SingleChildScrollView Body2(String imagencirc ,String titulo,String contenido,String imagennormal)  {
    return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          imagencirc,
                          width:
                              180.0, // Ajusta el ancho según tus necesidades
                          height:
                              180.0, // Ajusta la altura según tus necesidades
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Tarjeta(
                        titulo: titulo,
                        contenido: contenido,
                      ),
                      Image.asset(
                        imagennormal,
                             width: 400.0, // Ajusta el ancho según tus necesidades
                        height: 210.0,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                );
  }

