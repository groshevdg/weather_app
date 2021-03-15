import 'package:weather_app/data/repository.dart';
import 'package:weather_app/models/weather_info.dart';

class UseCase {
  final Repository _repository = Repository();

  Future<WeatherInfo> getWeatherByCity(String cityName) async {
    try {
      return _repository.loadWeatherInfoByCity(cityName);
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}