import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gritstone_machine_test/features/alarm/bloc/alarm_bloc.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/bg_filtter.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    // final width = MediaQuery.sizeOf(context).width;
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Add Alarm', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Bg(height: height),
          Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      'Alarm Label',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (controller.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please Add Label'),
                      ),
                    );
                  } else {
                    context.read<AlarmBloc>().add(
                          SetAlarmEvent(
                              context: context, label: controller.text),
                        );
                  }
                },
                child: const Text('Next'),
              )
            ],
          )
        ],
      ),
    );
  }
}
