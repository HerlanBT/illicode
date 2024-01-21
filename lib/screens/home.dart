// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../widgets/bodys.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/headerfont.dart';
import '../widgets/textos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 54, 1, 47),
              Color.fromARGB(255, 26, 1, 31)
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ImageSlider(),
                      Positioned(top: 0, left: 0, right: 0, child: Header())
                    ],
                  ),
                  Body1('principal.jpg', titulo1, principal, 'illi1.jpg'),
                  SizedBox(
                    height: 30,
                  ),
                  Body2('illi7.jpg', titulo2, contenidoweb, 'web4.png'),
                  SizedBox(
                    height: 30,
                  ),
                  Body1('sisnego.jpg', titulo3, contenidonegocios, 'illi3.jpg'),
                  SizedBox(
                    height: 30,
                  ),
                  Body2('illi11.jpg', titulo4, contenidomulti, 'web3.jpg'),
                  SizedBox(
                    height: 30,
                  ),
                  Footer(),
                ],
              ),
            ),
          ),
        ));
  }
}
