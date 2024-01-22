import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: isSmallScreen ? null : MediaQuery.of(context).size.width, // Ancho estático si la pantalla es mayor a 600
        color: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '© 2024 Illimani Code',
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 12 : 14,
              ),
            ),
            SizedBox(width: 20),
            Text(
              'Terminos y Condiciones',
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 12 : 14,
              ),
            ),
            SizedBox(width: 20),
            Text(
              'Política de Privacidad',
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 12 : 14,
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
