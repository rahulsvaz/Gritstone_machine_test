import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:flutter/material.dart';
import 'package:gritstone_machine_test/features/alarm/ui/add_alarm_page.dart';
import 'package:gritstone_machine_test/features/helper/helper.dart';
import 'package:gritstone_machine_test/features/home_screen/view/Widgets/location_text.dart';
import 'package:gritstone_machine_test/features/home_screen/view/Widgets/temperature_text.dart';
import 'package:gritstone_machine_test/features/home_screen/view/Widgets/temperature.dart';
import 'package:gritstone_machine_test/features/home_screen/view/Widgets/weather_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AlarmSettings> alarms = [];

  void loadAlarms() {
    alarms = Alarm.getAlarms();
    alarms.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? 0 : 1);
  }

  @override
  void initState() {
    if (Alarm.android) {
      Helper.checkAndroidNotificationPermission();
      Helper.checkAndroidScheduleExactAlarmPermission();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.jpg',
            height: height,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: height * 0.02,
            left: 0,
            right: 0,
            child: Center(
              child: WeatherImage(height: height),
            ),
          ),
          Positioned(
            top: height * 0.36,
            left: 0,
            right: 0,
            child: const Temperature(),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: height * 0.45,
            child: const Center(
              child: TemperatureText(),
            ),
          ),
          Positioned(
            top: height * 0.50,
            left: 0,
            right: 0,
            child: Center(child: LocationText(height: height)),
          ),
          const SizedBox(
            height: 15,
          ),
          Positioned(
            top: height * 0.65,
            left: 0,
            right: 0,
            child: Center(
              child: TextButton(
                onPressed: () async {
                  // Alarm.stop(1);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddAlarm(),
                    ),
                  );
                },
                child: const Text(
                  'Add Alarm',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
              top: height * 0.70,
              child: Container(
                  width: width,
                  height: height * 0.2,
                  child: Text('No Alarms'))),
        ],
      ),
    );
  }
}
