import 'package:dio/dio.dart';
import 'package:weather_app/config/consts.dart';
import 'package:weather_app/models/details_forecast.dart';
import 'package:weather_app/models/weather_info.dart';

class Repository {
  final Dio dio = Dio();

  Future<WeatherInfo> loadWeatherInfoByCity(String cityName) async {
    var response = await dio.get("https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=${Consts.API_KEY}&units=metric");
    if (response != null && response.statusCode == 200) {
      return WeatherInfo.fromJson(response.data);
    }
    else {
      return null;
    }
  }

  Future<List<DetailsForecast>> loadForecast(String cityName) async {
    var response = await dio.get("https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=${Consts.API_KEY}&units=metric");
    if (response != null && response.statusCode == 200) {
      return _getFiveDaysForecastFromResponse(response);
    }
    else {
      throw Exception("Response is empty");
    }
  }

  List<DetailsForecast> _getFiveDaysForecastFromResponse(Response response) {
    var list = <DetailsForecast>[];
    var secondsInDay = 86400;
    int targetTime;
    response.data["list"].forEach((item) {
      targetTime ??= item['dt'] as int;

      if (targetTime == item['dt']) {
        list.add(DetailsForecast.fromJson(item));
        targetTime += secondsInDay;
      }
    });

    return list;
  }
}