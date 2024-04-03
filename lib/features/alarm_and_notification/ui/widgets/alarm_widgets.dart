import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gritstone_machine_test/features/alarm_and_notification/bloc/alarms_bloc.dart';
import 'package:gritstone_machine_test/features/alarm_and_notification/ui/add_alarm_page.dart';

class AlarmWidget extends StatelessWidget {
  const AlarmWidget({
    super.key,
    required this.height,
    required this.alarmInfo,
    required this.cityNAme,
    required this.temp,
    required this.alarmTime,
  });
  final String alarmTime;
  final double height;
  final String alarmInfo;
  final String cityNAme;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height * 0.06,
        ),
        Text(
          alarmInfo,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAlarm(
                      place: cityNAme,
                      temp: temp,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.add_alarm,
                size: 30,
                color: Colors.green,
              ),
            ),
          const  SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAlarm(
                      place: cityNAme,
                      temp: temp,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.edit,
                size: 30,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {
                context.read<AlarmsBloc>().add(DeleteAlarmsEvent(context: context));
              },
              icon: const Icon(
                Icons.delete,
                size: 30,
                color: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Text(
          alarmTime,
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
