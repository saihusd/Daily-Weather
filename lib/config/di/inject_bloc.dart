import 'package:dailyweather/config/di/service_locator.dart';
import 'package:dailyweather/presentation/bloc/weather_bloc.dart';

Future<void> injectBlocs() async {
  // initialize blocs
  sl.registerSingleton(WeatherBloc());
}