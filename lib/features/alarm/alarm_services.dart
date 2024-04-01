import 'package:alarm/model/alarm_settings.dart';

class ALaramServices {
  static final alaramSetting = AlarmSettings(
      id: 1,
      dateTime: DateTime.now(),
      assetAudioPath: 'assets/mp3/Periyone.mp3',
      notificationTitle: 'Alaram',
      notificationBody: 'Alaram Test',
      enableNotificationOnKill: true);
}
