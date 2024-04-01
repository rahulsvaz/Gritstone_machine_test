import 'dart:developer';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gritstone_machine_test/features/alarm/bloc/alarm_bloc.dart';
import 'package:gritstone_machine_test/features/home_screen/view/Widgets/bg_filtter.dart';

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
            child: Text(
              'Kozhikode',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: height * 0.03,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: height * 0.14,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(height: height * 0.34, 'assets/images/1.png'),
            ),
          ),
          Positioned(
            top: height * 0.48,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                '30°C',
                style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: height * 0.56,
            child: const Center(
              child: Text(
                'Heat',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Positioned(
            left: width * 0.05,
            right: 0,
            top: height * 0.65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Center(
                  child: Text(
                    'Alarms',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: width * 0.5,
                ),
                IconButton(
                  onPressed: () async {
                    BlocProvider.of<AlarmBloc>(context).add(
                      SetAlarmEvent(context: context),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              ],
            ),
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
