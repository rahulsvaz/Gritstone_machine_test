import 'package:flutter/material.dart';

class TemperatureText extends StatelessWidget {
  const TemperatureText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Heat',
      style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
    );
  }
}
