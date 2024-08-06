import 'package:dio/dio.dart';
import 'package:weather/Models/WeatherModel.dart';

class WeatherService {
  final String baseURL = 'http://api.weatherapi.com/v1';
  final String key = 'c44c2290cbdb4f99b38170749241502';
  final Dio dio;

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseURL/forecast.json?key=$key&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oops there is an error';
      throw Exception(errorMessage);
    }
  }
}
