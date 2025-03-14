import 'package:dailyweather/core/Theme/using_color.dart';
import 'package:dailyweather/presentation/screen/weather_forecasts_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'config/di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Weather',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: sl<UsingColor>().blueColor,
          iconTheme: IconThemeData(
            color: sl<UsingColor>().whiteColor
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: sl<UsingColor>().blueColor),
        useMaterial3: true,
      ),
      home: WeatherForecastsList(),
      debugShowCheckedModeBanner: false,
    );
  }
}