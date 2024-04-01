

import 'package:flutter/material.dart';

class LocationText extends StatelessWidget {
  const LocationText({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Kozhikode',
      style: TextStyle(
          color: Colors.white,
          fontSize: height * 0.03,
          fontWeight: FontWeight.bold),
    );
  }
}
