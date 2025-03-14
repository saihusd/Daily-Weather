import 'package:dailyweather/config/di/service_locator.dart';
import 'package:dailyweather/core/Theme/using_color.dart';
import 'package:flutter/material.dart';

class UsingTextStyles{

  final TextStyle textStyle1 = TextStyle(fontSize: 22, color: sl<UsingColor>().whiteColor, fontWeight: FontWeight.w600);
  final TextStyle textStyle2 = TextStyle(fontSize: 16,fontWeight: FontWeight.w600);
  final TextStyle textStyle3 = TextStyle(fontSize: 14,fontWeight: FontWeight.w500);
  final TextStyle textStyle4 = TextStyle(fontSize: 18);

}