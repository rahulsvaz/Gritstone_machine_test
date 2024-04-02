import 'package:flutter/material.dart';

class TemperatureText extends StatelessWidget {
  final String text;
  const TemperatureText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text °C',
      style: const TextStyle(
          fontSize: 100, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
