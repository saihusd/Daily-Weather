import 'package:dailyweather/config/di/service_locator.dart';
import 'package:dailyweather/core/Theme/using_color.dart';
import 'package:dailyweather/core/Theme/using_textstyles.dart';
import 'package:dailyweather/presentation/bloc/weather_bloc.dart';
import 'package:dailyweather/presentation/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherForecastListDetail extends StatelessWidget {
  const WeatherForecastListDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sl<UsingColor>().whiteColor1,
      appBar: CommonWidget().commonAppBar(title: 'Weather Details', actionButton: [SizedBox()]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonWidget().commonSizedBox(height: 30),
          Text(DateFormat('EEEE, MMMM d, y').format(DateTime.parse(sl<WeatherBloc>().weatherForecastListModel.list[sl<WeatherBloc>().selectedIndex].dtTxt)),style: sl<UsingTextStyles>().textStyle2.copyWith(fontSize: 18)),
          Text(DateFormat('h:mm a').format(DateTime.parse(sl<WeatherBloc>().weatherForecastListModel.list[sl<WeatherBloc>().selectedIndex].dtTxt)),style: sl<UsingTextStyles>().textStyle3.copyWith(fontSize: 18)),
          CommonWidget().commonSizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonWidget().commonSizedBox(width: 50),
              Text("${sl<WeatherBloc>().weatherForecastListModel.list[sl<WeatherBloc>().selectedIndex].main.temp} ℃",style: sl<UsingTextStyles>().textStyle2.copyWith(fontSize: 36)),
              sl<WeatherBloc>().weatherForecastListModel.list[sl<WeatherBloc>().selectedIndex].weather.isNotEmpty
                  ? Image.network('https://openweathermap.org/img/wn/${sl<WeatherBloc>().weatherForecastListModel.list[sl<WeatherBloc>().selectedIndex].weather.first.icon}@2x.png',height: 160,width: 160,fit: BoxFit.fill,)
                  : const SizedBox()
            ],
          ),
          CommonWidget().commonSizedBox(height: 30),
          sl<WeatherBloc>().weatherForecastListModel.list[sl<WeatherBloc>().selectedIndex].weather.isNotEmpty
              ? Text("${sl<WeatherBloc>().weatherForecastListModel.list[sl<WeatherBloc>().selectedIndex].weather.first.main} (${sl<WeatherBloc>().weatherForecastListModel.list[sl<WeatherBloc>().selectedIndex].weather.first.description})",style: sl<UsingTextStyles>().textStyle3.copyWith(fontSize: 16))
              : const SizedBox(),
          CommonWidget().commonSizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Temp (min)",style: sl<UsingTextStyles>().textStyle4.copyWith(fontSize: 13)),
                  Text("${sl<WeatherBloc>().weatherForecastListModel.list[sl<WeatherBloc>().selectedIndex].main.tempMin} ℃",style: sl<UsingTextStyles>().textStyle3)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Temp (max)",style: sl<UsingTextStyles>().textStyle4.copyWith(fontSize: 13)),
                  Text("${sl<WeatherBloc>().weatherForecastListModel.list[sl<WeatherBloc>().selectedIndex].main.tempMax} ℃",style: sl<UsingTextStyles>().textStyle3)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
