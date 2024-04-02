

import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherDescription extends StatelessWidget {
  const WeatherDescription({
    super.key,
    required this.weather,
    required this.width,
  });

  final Weather weather;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Text(
      weather.weatherDescription!.toUpperCase(),
      style: TextStyle(
          color: Colors.white,
          fontSize: width * 0.05,
          fontWeight: FontWeight.bold),
    );
  }
}
