import 'package:flutter/material.dart';

class WeatherData{

  WeatherData({@required this.jsonData});

  final jsonData;

  String GetCityName(){
    return jsonData['name'];
  }
}