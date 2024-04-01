import 'package:alarm/alarm.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'alarm_event.dart';
part 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  AlarmBloc() : super(AlarmInitial()) {
    on<AlarmEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
