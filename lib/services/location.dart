import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location{

  Position _position;

  Future<Position> GetCurrentLocation() async{
    try {
       _position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    }catch (e){
      print(e);
    }

    return _position;
  }

  double GetLatitude(){
    return _position.latitude;
  }

  double GetLongitude(){
    return _position.longitude;
  }

}