import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/utilities/WeatherData.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void _getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    //Navigator.pushNamed(context, '/location', arguments: weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherData: weatherData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();

    _getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
