part of 'alarm_bloc.dart';

sealed class AlarmEvent extends Equatable {
  const AlarmEvent();

  @override
  List<Object> get props => [];
}

class SetAlarmEvent extends AlarmEvent {
  final BuildContext context;
  final String label;

  const SetAlarmEvent({required this.context, required this.label});
  @override
  List<Object> get props => [context];
}

class StopAlarmEvent extends AlarmEvent {}
