import 'package:weather_app/config/consts.dart';
import 'package:weather_app/data/repository.dart';
import 'package:weather_app/models/result.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/usecase/managers/database_manager.dart';

class UseCase {
  final Repository _repository = Repository();
  final DatabaseManager _databaseManager = DatabaseManager();

  Future<Result<WeatherInfo>> getWeatherByCity(String cityName) async {
    try {
      var weatherInfo = await _repository.loadWeatherInfoByCity(cityName);
      if (weatherInfo != null) {
        await _databaseManager.insertNewCity(weatherInfo);
        return Result(isSuccessful: true, data: weatherInfo);
      }
      else {
        throw Exception("Error while loading data");
      }
    } on Exception catch (e) {
      print(e.toString());
      return Result(isSuccessful: false, exception: e);
    }
  }

  Future<Result<List<WeatherInfo>>> initialLoad() async {
    var cachedWeatherInfo = await _databaseManager.getWeatherInfo();
    var requests = _fillRequestsList(cachedWeatherInfo);

    try {
      var responses = await Future.wait(requests);
      if (responses != null && responses.isNotEmpty) {
        await _databaseManager.insertWeatherInfo(responses);
        return Result(isSuccessful: true, data: responses.cast<WeatherInfo>());
      }
      else {
        throw Exception("Response is empty");
      }
    } on Exception catch (e) {
      return Result(isSuccessful: false, exception: e, data: cachedWeatherInfo);
    }
  }

  List<Future> _fillRequestsList(List<WeatherInfo> weatherInfo) {
    var requests = <Future>[];
    if (weatherInfo == null) {
      // fill list by default cities
      requests.add(_repository.loadWeatherInfoByCity(Consts.MOSCOW));
      requests.add(_repository.loadWeatherInfoByCity(Consts.TAGANROG));
    }
    else {
      weatherInfo.forEach((item) {
        requests.add(_repository.loadWeatherInfoByCity(item.cityName));
      });
    }
    return requests;
  }
}