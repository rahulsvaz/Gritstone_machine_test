import 'package:clock_loader/clock_loader.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClockLoader(
        clockLoaderModel: ClockLoaderModel(
            mainHandleColor: Colors.white,
            particlesColor: Colors.grey,
            shapeOfParticles: ShapeOfParticlesEnum.circle),
      ),
    );
  }
}
