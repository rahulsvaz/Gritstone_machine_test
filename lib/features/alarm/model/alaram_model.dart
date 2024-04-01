import 'package:hive/hive.dart';
part 'alaram_model.g.dart';

@HiveType(typeId: 1)
class AlarmModel extends HiveObject {
  @HiveField(0)
  final DateTime alarmTime;
  @HiveField(1)
  final String alarmMsg;
  @HiveField(2)
  final int id;

  AlarmModel(this.id, {required this.alarmTime, required this.alarmMsg});
}
