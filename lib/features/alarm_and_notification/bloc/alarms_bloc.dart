import 'dart:async';
import 'dart:developer';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:bloc/bloc.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'alarms_event.dart';
part 'alarms_state.dart';

class AlarmsBloc extends Bloc<AlarmsEvent, AlarmsState> {
  AlarmsBloc() : super(AlarmsInitial()) {
    on<AddAlarmEvent>(_addAlarm);

    on<AlarmInitialEvent>(_initDatabase);
    on<DeleteAlarmsEvent>(_deleteAlarm);
  }

/* to add alarm
 first we are selecting a date with showboardDateTime Picker

 set alarm details 
 then call the function alarm .set and pass the alarm details inside the function

 same as edit and delete alarm option we can change the data with in the event

*/
  FutureOr<void> _addAlarm(
      AddAlarmEvent event, Emitter<AlarmsState> emit) async {
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
        final alarmSetting = AlarmSettings(
            id: 1,
            volume: 1,
            dateTime: result,
            assetAudioPath: 'assets/mp3/Periyone.mp3',
            notificationTitle: event.label,
            loopAudio: false,
            notificationBody: 'Please Open the App To Turn Off Alarm',
            enableNotificationOnKill: true);

        await Alarm.set(alarmSettings: alarmSetting);
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('label', event.label);
        pref.setString('alarmTime',
            DateFormat('EEEE M/d/y').add_jm().format(result).toString());
        emit(
          AlarmAddedState(label: event.label, addedDate: result, pref),
        );
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

  /*
  here we init database and set label and time as string and passing in the states and events
  so whenever we hit an event and emit a state we can easily access tha shared preferences data with 
  event and emit key word 
  */

  FutureOr<void> _initDatabase(
      AlarmInitialEvent event, Emitter<AlarmsState> emit) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      emit(DataBaseInitial(pref: pref));
      log('database');
      log(pref.getString('label').toString());

      emit(DataBaseInitial(pref: pref));
    } catch (e) {
      log(e.toString());
    }
  }

  FutureOr<void> _deleteAlarm(
      DeleteAlarmsEvent event, Emitter<AlarmsState> emit) async {
    await Alarm.stop(1);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('label', 'No Alarms Found');

    pref.setString('alarmTime', '');

    emit(AlarmDeletedState());
    ScaffoldMessenger.of(event.context).showSnackBar(
      const SnackBar(
        content: Text('Alarm Deleted '),
      ),
    );
  }
}
