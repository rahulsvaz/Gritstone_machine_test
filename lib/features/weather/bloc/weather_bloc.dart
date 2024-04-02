import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeatherEvent>(getWeather);
  }

  FutureOr<void> getWeather(
      GetWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    const apiKey = '2e789dd8f96aa9c712c3d7582deada9f';
    try {
      WeatherFactory weatherFactory =
          WeatherFactory(apiKey, language: Language.ENGLISH);

      // Weather weather =
      //     await weatherFactory.currentWeatherByLocation('latitude', longitude);
      
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
