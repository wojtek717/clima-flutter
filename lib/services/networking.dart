import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper{

  final String _url;

  NetworkHelper(this._url);



  Future GetData() async{
    Response r = await get(_url);

    if(r.statusCode == 200){
      var decodedData = jsonDecode(r.body);

      return decodedData;

    }else{
      print(r.statusCode);
    }
  }


}