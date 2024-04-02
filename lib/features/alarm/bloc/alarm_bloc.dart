import 'dart:async';
import 'dart:developer';
import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:bloc/bloc.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        options: const BoardDateTimeOptions(backgroundColor: Colors.white),
        context: event.context,
        pickerType: DateTimePickerType.datetime,
      );
      if (result!.isBefore(DateTime.now())) {
        ScaffoldMessenger.of(event.context).showSnackBar(
          const SnackBar(
            content: Text('Select an upcoming time and Date'),
          ),
        );
      } else {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('label', event.label);
        pref.setString('time', result.toString());
        final alarmSetting = AlarmSettings(
            id: 1,
            volume: 1,
            dateTime: result,
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
        Navigator.pop(event.context);
        await Alarm.setNotificationOnAppKillContent(
            'Wake Up Buddy', 'You Are getting late');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
