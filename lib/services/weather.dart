import 'package:flutter/material.dart';
import './location.dart';
import './network.dart';

const apiKey = 'd8a2b98bfbae6e243d94cff20fffc585';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  Image getWeatherImage(int condition) {
    if (condition < 300) {
      return Image.asset('assets/images/thunderstorm48.png');
    } else if (condition < 400) {
      return Image.asset('assets/images/drizzle48.png');
    } else if (condition < 600) {
      return Image.asset('assets/images/rain48.png');
    } else if (condition < 700) {
      return Image.asset('assets/images/snow48.png');
    } else if (condition < 800) {
      return Image.asset('assets/images/cloud48.png');
    } else if (condition == 800) {
      return Image.asset('assets/images/sun48.png');
    } else if (condition <= 804) {
      return Image.asset('assets/images/clouds48.png');
    } else {
      return Image.asset('assets/images/unavailable48.png');
    }
  }

  String getWeatherInfo(int condition){
    if (condition < 300) {
      return 'Thunderstorm';
    } else if (condition < 400) {
      return 'Drizzle';
    } else if (condition < 600) {
      return 'Rain';
    } else if (condition < 700) {
      return 'Snow';
    } else if (condition < 800) {
      return 'Cloud';
    } else if (condition == 800) {
      return 'Sun';
    } else if (condition <= 804) {
      return 'Clouds';
    } else {
      return 'Unavailable';
    }
  }

}