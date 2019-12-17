import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/WeatherData.dart';

const apiKey = 'c26e17895fdf12b02bcd5e7f4e01e347';

class WeatherModel {

  double _lat;
  double _long;

  Future<WeatherData> getCityWeather(String cityName) async{

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');

    Map jsonDecodedData = await networkHelper.GetData();
    WeatherData weatherData = WeatherData.fromJson(jsonDecodedData);

    return weatherData;
  }

  Future<WeatherData> getLocationWeather() async{
    Location location = Location();
    await location.GetCurrentLocation();

    _lat = location.GetLatitude();
    _long = location.GetLongitude();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$_lat&lon=$_long&appid=$apiKey');

    Map jsonDecodedData = await networkHelper.GetData();
    WeatherData weatherData = WeatherData.fromJson(jsonDecodedData);

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
