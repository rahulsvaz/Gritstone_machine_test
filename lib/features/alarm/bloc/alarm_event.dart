part of 'alarm_bloc.dart';

sealed class AlarmEvent extends Equatable {
  const AlarmEvent();

  @override
  List<Object> get props => [];
}

class SetAlarmEvent extends AlarmEvent {
  final BuildContext context;


  const SetAlarmEvent( {required this.context});
  @override
  List<Object> get props => [context];
}

class StopAlarmEvent extends AlarmEvent {}
