import 'dart:developer';
import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gritstone_machine_test/features/alarm/ui/add_alarm_page.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/bg_image.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/date_time.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/developed_by.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/get_weather_icon.dart';
import 'package:gritstone_machine_test/features/weather/ui/widgets/goto_alarm_page.dart';
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
  List<AlarmSettings> alarms = [];

  void loadAlarms() {
    alarms = Alarm.getAlarms();
    alarms.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? 0 : 1);
  }

  @override
  void initState() {
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
        if (snapshot.hasData) {
          BlocProvider.of<WeatherBloc>(context).add(
            GetWeatherEvent(position: snapshot.data as Position),
          );
        }
        return Scaffold(
          body: Stack(
            children: [
              BgImage(height: height),
              Positioned(
                top: height * 0.8,
                left: 0,
                right: 0,
                child: Center(
                  child: GotoAlarmPage(
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddAlarm(),
                        ),
                      );
                    },
                  ),
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
                    return Column(
                      children: [
                        SizedBox(
                          height: height * 0.07,
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

                        SizedBox(
                          height: height * 0.1,
                        ),

                        const DevelopedByText(),
                        //
                      ],
                    );
                  } else {
                    return const LoadingIndicator();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
