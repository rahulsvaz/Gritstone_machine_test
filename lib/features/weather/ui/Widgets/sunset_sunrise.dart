import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class SunsetSunrise extends StatelessWidget {
  const SunsetSunrise({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/11.png',
              scale: 8,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sunrise',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  DateFormat().add_jm().format(weather.sunset!),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/12.png',
              scale: 8,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sunset',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  DateFormat().add_jm().format(weather.sunrise!),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
