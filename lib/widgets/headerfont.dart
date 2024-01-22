import 'dart:async';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late PageController _pageController;
  late int _currentPage;
  late List<String> _imageList;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageList = ['images/illibanner1.jpg', 'images/illibanner2.jpg', 'images/illibanner3.jpg'];
    _currentPage = 0;
    _pageController = PageController(initialPage: _currentPage);

    // Configura el temporizador para cambiar de imagen cada 3 segundos
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _imageList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Image.asset(
            _imageList[index],
            width: MediaQuery.of(context).size.width,
            height: 150,
            fit: BoxFit.cover,
          );
        },
        itemCount: _imageList.length,
      ),
    );
  }
}
