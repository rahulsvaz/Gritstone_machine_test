import 'dart:ui';

import 'package:flutter/material.dart';

class Bg extends StatelessWidget {
  const Bg({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(
            3,
            -0.3,
          ),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.indigo),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(
            -3,
            -0.3,
          ),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.indigo),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(
            0,
            -1.2,
          ),
          child: Container(
            height: 300,
            width: 600,
            decoration: BoxDecoration(color: Color.fromARGB(255, 110, 75, 29)),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
          child: Container(
            height: height,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
