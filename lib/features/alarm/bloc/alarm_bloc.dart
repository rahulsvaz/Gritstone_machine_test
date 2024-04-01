import 'dart:async';
import 'dart:developer';
import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:bloc/bloc.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'alarm_event.dart';
part 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  AlarmBloc() : super(AlarmInitial()) {
    on<SetAlarmEvent>(_setAlarmEvent);
  }
  FutureOr<void> _setAlarmEvent(
      SetAlarmEvent event, Emitter<AlarmState> emit) async {

    try {
      final result = await showBoardDateTimePicker(
        options:const  BoardDateTimeOptions(backgroundColor: Colors.white),
        context: event.context,
        pickerType: DateTimePickerType.datetime,
      );

      final alarmSetting = AlarmSettings(
          id: 1,
          volume: 1,
          dateTime: result!,
          assetAudioPath: 'assets/mp3/Periyone.mp3',
          notificationTitle: 'Alarm',
          loopAudio: false,
          notificationBody: 'Alarm Test',
          enableNotificationOnKill: true);

      await Alarm.set(alarmSettings: alarmSetting);
      log(
        'Alarm added ',
      );
      ScaffoldMessenger.of(event.context).showSnackBar(
        SnackBar(
          content: Text('Alarm Added At $result'),
        ),
      );
      await Alarm.setNotificationOnAppKillContent(
          'Wake Up Buddy', 'You Are getting late');
    } catch (e) {
      log(e.toString());
    }

    // DateTime now = DateTime.now();
    // Navigator.of(event.context).push(
    //   showPicker(
    //     context: event.context,
    //     value: time,
    //     sunrise: const TimeOfDay(hour: 6, minute: 0), // optional
    //     sunset: const TimeOfDay(hour: 18, minute: 0), // optional
    //     duskSpanInMinutes: 120, // optional
    //     onChange: (value) async {
    //       time = value;
    //       try {
    //         DateTime alarmTime =
    //             DateTime(now.year, now.month, now.day, time.hour, time.minute);
    //         log('alarm time $alarmTime');

    //       } catch (e) {
    //         log(
    //           e.toString(),
    //         );
    //       }
    //     },
    //   ),
    // );
  }
}
