


import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/bg.jpg',
      height: height,
      fit: BoxFit.cover,
    );
  }
}
