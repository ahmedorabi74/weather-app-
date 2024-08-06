import 'dart:ffi';

class WeatherModel {
  final String cityName;
  final String data;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherState;

  WeatherModel(
      {required this.cityName,
      required this.data,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherState});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      cityName: json['location']['name'],
      data: json['current']['last_updated'],
      temp: json['current']['temp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherState: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
