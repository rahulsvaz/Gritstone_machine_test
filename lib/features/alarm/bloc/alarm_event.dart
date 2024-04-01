part of 'alarm_bloc.dart';

sealed class AlarmEvent extends Equatable {
  const AlarmEvent();

  @override
  List<Object> get props => [];
}

class SetAlarmEvent extends AlarmEvent{}
class StopAlarmEvent extends AlarmEvent{}