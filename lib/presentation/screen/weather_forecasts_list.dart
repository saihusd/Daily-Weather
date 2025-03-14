import 'package:dailyweather/config/di/service_locator.dart';
import 'package:dailyweather/core/Theme/using_color.dart';
import 'package:dailyweather/presentation/bloc/weather_bloc.dart';
import 'package:dailyweather/presentation/widget/common_widgets.dart';
import 'package:flutter/material.dart';

class WeatherForecastsList extends StatelessWidget {
  const WeatherForecastsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sl<UsingColor>().whiteColor1,
      appBar: CommonWidget().commonAppBar(title: 'Weather App', actionButton: [IconButton(onPressed: (){sl<WeatherBloc>().add(WeatherIntialEvent());}, icon: Icon(Icons.refresh))]),
      body: CommonWidget().weatherListTile(),
    );
  }
}
