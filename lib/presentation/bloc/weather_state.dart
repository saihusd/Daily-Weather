part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherLoadedState extends WeatherState {}

final class WeatherErrorState extends WeatherState {}
