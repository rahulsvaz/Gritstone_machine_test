part of 'alarm_bloc.dart';

sealed class AlarmState extends Equatable {
  const AlarmState();
  
  @override
  List<Object> get props => [];
}

final class AlarmInitial extends AlarmState {}

final class AlarmRunningState extends AlarmState{}

