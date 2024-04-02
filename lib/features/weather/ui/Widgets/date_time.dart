

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class WeatherDateTime extends StatelessWidget {
  const WeatherDateTime({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text(
         DateFormat('EEEE M/d/y')
             .add_jm()
             .format(weather.date!),
         style: const TextStyle(
             color: Colors.white,
             fontSize: 16,
             fontWeight: FontWeight.w500),
       ),
     );
  }
}