import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gritstone_machine_test/helper/location_permission.dart';
import 'package:weather/weather.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeatherEvent>(getWeather);
  }
  FutureOr<void> getWeather(
      GetWeatherEvent event, Emitter<WeatherState> emit) async {
// in this api call iam not using http or dio method because i got a package to
// get data from weather api. so i need to provide the api key only here
// this is very good package for weather app because we don't want to create a
// model for weather
    emit(
      WeatherLoading(),
    );
// to get location
    await Location.determinePosition();
    const apiKey = '2e789dd8f96aa9c712c3d7582deada9f';
    try {
      // weather factory comes from weather package
      WeatherFactory weatherFactory = WeatherFactory(
        apiKey,
      );
      // in this event i am taking lat and long from snapshot data as position
      // in get weather event passing the data as position so we will get the data as position here

      Weather weather = await weatherFactory.currentWeatherByLocation(
          event.position.latitude, event.position.longitude);

      emit(
        WeatherSuccessState(weather: weather),
      );
    } catch (e) {
      emit(
        WeatherFailure(),
      );
    }
  }
}
