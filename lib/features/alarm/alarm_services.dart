import 'package:alarm/model/alarm_settings.dart';

class ALaramServices {

  
  static final alarmSetting = AlarmSettings(
      id: 1,
      volume: 1,
      dateTime: DateTime.now(),
      assetAudioPath: 'assets/mp3/Periyone.mp3',
      notificationTitle: 'Alarm',
      notificationBody: 'Alarm Test',
      enableNotificationOnKill: true);
}
