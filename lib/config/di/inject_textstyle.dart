import 'package:dailyweather/config/di/service_locator.dart';
import 'package:dailyweather/core/Theme/using_textstyles.dart';

Future<void> injectTextStyles() async {
  sl.registerSingleton(UsingTextStyles());
}