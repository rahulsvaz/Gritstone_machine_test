


import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(height: height * 0.34, 'assets/images/1.png');
  }
}

