import 'dart:developer';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gritstone_machine_test/features/alarm_and_notification/ui/add_alarm_page.dart';
import 'package:gritstone_machine_test/features/alarm_and_notification/bloc/alarms_bloc.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/bg_image.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/date_time.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/get_weather_icon.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/loading.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/sunset_sunrise.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/weather_description.dart';
import 'package:gritstone_machine_test/features/weather/bloc/weather_bloc.dart';
import 'package:gritstone_machine_test/helper/location_permission.dart';
import 'package:gritstone_machine_test/helper/notification_permission.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/temperature_text.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/place.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({
    super.key,
  });
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    BlocProvider.of<AlarmsBloc>(context).add(AlarmInitialEvent());
    if (Alarm.android) {
      Helper.checkAndroidNotificationPermission();
      Helper.checkAndroidScheduleExactAlarmPermission();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return FutureBuilder(
      future: Location.determinePosition(),
      builder: (context, snapshot) {
        String cityNAme = '';
        String temp = '';
        
        if (snapshot.hasData) {
          final Position wp = snapshot.data as Position;

          BlocProvider.of<WeatherBloc>(context).add(
            GetWeatherEvent(position: wp),
          );
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: height,
              width: width,
              child: Stack(
                children: [
                  BgImage(height: height),
                  Positioned(
                    top: height * 0.05,
                    left: 0,
                    right: 0,
                    child: const Center(
                      child: Text(
                        'Alarms',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Positioned(
                    height: height * 0.22,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BlocBuilder<AlarmsBloc, AlarmsState>(
                          builder: (context, state) {
                            String alarmInfo = 'NO ALARMS FOUND';
                            if(state is DataBaseInitial){
                              state.pref.getString('label')!.isEmpty?  
                              alarmInfo = 'No Alarms ': alarmInfo = state.pref.getString('label')!;
                            }
                            if (state is AlarmAddedState) {
                              String? label = state.pref.getString('label');
                              alarmInfo = label!;
                            }
                            return Text(
                              alarmInfo,
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            );
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddAlarm(
                                  place: cityNAme,
                                  temp: temp,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.add_alarm,
                            size: 30,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) {
                      if (state is WeatherLoading) {
                        log('Loading state');
                        return const LoadingIndicator();
                      }
                      if (state is WeatherSuccessState) {
                        final weather = state.weather;
                        cityNAme = weather.areaName!;
                        temp = weather.temperature!.celsius!.round.toString();
                        return Column(
                          children: [
                            SizedBox(
                              height: height * 0.15,
                            ),
                            Place(
                              callback: () {
                                context.read<WeatherBloc>().add(
                                      GetWeatherEvent(
                                          position: snapshot.data as Position),
                                    );
                              },
                              place: weather.areaName!,
                            ),
                            TemperatureText(
                              text: state.weather.temperature!.celsius!
                                  .round()
                                  .toString(),
                            ),
                            HelperWidgets.getWeatherIcon(
                                weather.weatherConditionCode!, height),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            WeatherDescription(weather: weather, width: width),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            WeatherDateTime(weather: weather),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            SunsetSunrise(weather: weather),
                            ElevatedButton(
                                onPressed: () {}, child: Text('stop'))
                          ],
                        );
                      } else {
                        return const LoadingIndicator();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
