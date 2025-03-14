import 'dart:convert';
import 'package:dailyweather/data/models/weather_forecast_list_model.dart';
import 'package:dailyweather/data/repository/api_endpoints.dart';
import 'package:dailyweather/data/repository/network_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherForecastListModel weatherForecastListModel = WeatherForecastListModel.fromJson({});
  int selectedIndex = 0;

  WeatherBloc() : super(WeatherLoadingState()) {

    on<WeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());
      weatherForecastListModel = await NetworkApiService().requestApi(url: ApiEndPoints().weatherApi);
      if(weatherForecastListModel.message == 0){
        emit(WeatherLoadedState());
      }else{
        emit(WeatherErrorState());
      }

    });

  }
}
