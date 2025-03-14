import 'dart:developer';

import 'package:dailyweather/data/models/weather_forecast_list_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkApiService {

  final dio = Dio();

  Future<WeatherForecastListModel> requestApi({required String url}) async {
      try{
        final response = await dio.get(url);
        log("weather api response : $response");
        if (response.data["cod"] == "200") {
          // Convert response data to model
          return WeatherForecastListModel.fromJson(response.data);
        } else {
          print('Failed to fetch user data');
          return WeatherForecastListModel.fromJson({});
        }
      }catch(e){
        if (kDebugMode) {
          print("api error : $e");
        }
        return WeatherForecastListModel.fromJson({});
      }
    }

}