import 'package:dailyweather/core/constants/constants.dart';

class ApiEndPoints{

  final String weatherApi = "https://api.openweathermap.org/data/2.5/forecast?lat=${Constants().latitude}&lon=${Constants().longitude}&units=metric&appid=${Constants().apiKey}";

}