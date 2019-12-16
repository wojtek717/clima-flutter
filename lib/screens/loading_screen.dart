import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/utilities/WeatherData.dart';

const apiKey = 'c26e17895fdf12b02bcd5e7f4e01e347';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double _lat;
  double _long;

  void _getLocationData() async {
    Location location = Location();
    await location.GetCurrentLocation();

    _lat = location.GetLatitude();
    _long = location.GetLongitude();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$_lat&lon=$_long&appid=$apiKey');

    var jsonDecodedData = await networkHelper.GetData();
    WeatherData weatherData = WeatherData(jsonData: jsonDecodedData);

    Navigator.pushNamed(context, '/location', arguments: weatherData);

//    String cityName = weatherData['name'];
//    print(cityName);
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
