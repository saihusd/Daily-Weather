import 'package:dailyweather/config/di/service_locator.dart';
import 'package:dailyweather/core/Theme/using_color.dart';

Future<void> injectColors() async {
  sl.registerSingleton(UsingColor());
}