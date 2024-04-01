import 'dart:developer';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:gritstone_machine_test/features/home_screen/view/Widgets/bg_filtter.dart';
import 'package:gritstone_machine_test/features/home_screen/view/Widgets/location_text.dart';
import 'package:gritstone_machine_test/features/home_screen/view/Widgets/set_alarm_row.dart';
import 'package:gritstone_machine_test/features/home_screen/view/temperature_text.dart';
import 'package:gritstone_machine_test/features/home_screen/view/temperature.dart';
import 'package:gritstone_machine_test/features/home_screen/view/weather_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          Bg(height: height),
          Positioned(
            top: height * 0.08,
            left: width * 0.1,
            child: LocationText(height: height),
          ),
          Positioned(
            top: height * 0.14,
            left: 0,
            right: 0,
            child: Center(
              child: WeatherImage(height: height),
            ),
          ),
          Positioned(
            top: height * 0.48,
            left: 0,
            right: 0,
            child: const Temperature(),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: height * 0.56,
            child: const Center(
              child: TemperatureText(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Positioned(
            left: width * 0.05,
            right: 0,
            top: height * 0.65,
            child: SetAlarmSection(width: width),
          ),
          Positioned(
              top: height * 0.90,
              left: 0,
              right: 0,
              child: TextButton(
                onPressed: () async {},
                child: const Text('Add Alarm'),
              )),
          Positioned(
            top: height * 0.70,
            child: Container(
              width: width,
              height: height * 0.2,
              color: Colors.amber,
              child: ListView(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        try {
          await Alarm.stop(1);
        } catch (e) {
          log(
            e.toString(),
          );
        }
      }),
    );
  }
}

