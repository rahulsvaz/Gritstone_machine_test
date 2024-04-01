

import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  const Temperature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '30°C',
        style: TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }
}