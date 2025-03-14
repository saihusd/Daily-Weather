import 'package:dailyweather/config/di/service_locator.dart';
import 'package:dailyweather/core/Theme/using_textstyles.dart';
import 'package:dailyweather/presentation/bloc/weather_bloc.dart';
import 'package:dailyweather/presentation/screen/weather_forecast_list_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommonWidget {

  PreferredSizeWidget commonAppBar({required String title,required List<Widget> actionButton}) {
    return AppBar(
      title: Text(title, style: sl<UsingTextStyles>().textStyle1),
      actions: actionButton,
    );
  }

  Widget weatherListTile() {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: sl<WeatherBloc>()..add(WeatherIntialEvent()),
      builder: (context, state) {
        if(state is WeatherLoadingState){
          return Skeletonizer(
            enabled: true,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.cloud),
                      title: Text("Fri, March 14, 2025 3:00 PM",style: sl<UsingTextStyles>().textStyle2),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rain",style: sl<UsingTextStyles>().textStyle3),
                          Text("Temp: 26.9 ℃",style: sl<UsingTextStyles>().textStyle3.copyWith(fontSize: 13))
                        ],
                      ),
                      onTap: () {

                      },
                    ),
                    const Divider()
                  ],
                );
              },
              itemCount: 10,
            ),
          );
        }
        else if(state is WeatherErrorState){
          return Center(
            child: Image.asset('assets/oops.jpg'),
          );
        }
        return sl<WeatherBloc>().weatherForecastListModel.list.isNotEmpty
            ?  ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(
                  leading: sl<WeatherBloc>().weatherForecastListModel.list[index].weather.isNotEmpty
                      ? Image.network('https://openweathermap.org/img/wn/${sl<WeatherBloc>().weatherForecastListModel.list[index].weather.first.icon}@2x.png')
                      : const SizedBox(),
                  title: Text(DateFormat('EEE, MMMM d, y h:mm a').format(DateTime.parse(sl<WeatherBloc>().weatherForecastListModel.list[index].dtTxt)),style: sl<UsingTextStyles>().textStyle2),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(sl<WeatherBloc>().weatherForecastListModel.list[index].weather.isNotEmpty ? sl<WeatherBloc>().weatherForecastListModel.list[index].weather.first.main : "",style: sl<UsingTextStyles>().textStyle3),
                      Text("Temp: ${sl<WeatherBloc>().weatherForecastListModel.list[index].main.temp} ℃",style: sl<UsingTextStyles>().textStyle3.copyWith(fontSize: 13))
                    ],
                  ),
                  onTap: () {
                    sl<WeatherBloc>().selectedIndex = index;
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_) => WeatherForecastListDetail()));
                  },
                ),
                const Divider()
              ],
            );
          },
          itemCount: sl<WeatherBloc>().weatherForecastListModel.list.length,
        )
            : Center(child: Text("No Data Found",style: sl<UsingTextStyles>().textStyle4));
      },
    );
  }

  Widget commonSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

}