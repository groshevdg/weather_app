import 'package:dio/dio.dart';
import 'package:weather_app/config/consts.dart';
import 'package:weather_app/models/weather_info.dart';

class Repository {
  final Dio dio = Dio();

  Future<WeatherInfo> loadWeatherInfoByCity(String cityName) async {
    var response = await dio.get("https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=${Consts.API_KEY}&units=metric");
    if (response.statusCode == 200) {
      return WeatherInfo.fromJson(response.data);
    }
    else {
      return null;
    }
  }
}