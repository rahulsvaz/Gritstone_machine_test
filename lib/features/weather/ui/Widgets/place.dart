

import 'package:flutter/material.dart';

class Place extends StatelessWidget {
  final String place;
  const Place({
    super.key, required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        '📍 $place'
        ,
        style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }
}

//'30°C'