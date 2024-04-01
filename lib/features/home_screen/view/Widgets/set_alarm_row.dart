import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gritstone_machine_test/features/alarm/bloc/alarm_bloc.dart';

class SetAlarmSection extends StatelessWidget {
  const SetAlarmSection({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
