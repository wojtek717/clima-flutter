import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void _getLocation() async{
    Location location = Location();
    await location.GetCurrentLocation();
    print(location.GetLatitude());
    print(location.GetLongitude());
  }


  @override
  void initState() {
    super.initState();

    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
