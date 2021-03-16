import 'package:hive/hive.dart';
import 'package:pedantic/pedantic.dart';
import 'package:weather_app/config/consts.dart';
import 'package:weather_app/models/details_forecast.dart';
import 'package:weather_app/models/weather_info.dart';

class DatabaseManager {
  Future<void> insertWeatherInfo(List<dynamic> data) async {
    var listToSave = <WeatherInfo>[];
    data.forEach((item) { listToSave.add(item as WeatherInfo); });
    var box = await _getBox(Consts.WEATHER_BOX);
    unawaited(box.put(Consts.DATA, listToSave));
  }

  Future<List<WeatherInfo>> getWeatherInfo() async {
    var box = await _getBox(Consts.WEATHER_BOX);
    if (box.containsKey(Consts.DATA)) {
      List<dynamic> data = box.get(Consts.DATA);
      return data.cast();
    }
    else {
      return null;
    }
  }

  Future<void> insertNewCity(WeatherInfo item) async {
    var list = await getWeatherInfo();
    list.add(item);
    var box = await _getBox(Consts.WEATHER_BOX);
    unawaited(box.put(Consts.DATA, list));
  }

  Future<Box> _getBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    }
    else {
      return Hive.openBox(boxName);
    }
  }

  Future<void> insertDetailsForecast(String cityName, List<DetailsForecast> forecast) async {
    var box = await _getBox(cityName);
    unawaited(box.put(Consts.DATA, forecast));
  }

  Future<List<DetailsForecast>> getDetailsForecast(String cityName) async {
    var box = await _getBox(cityName);
    if (box.containsKey(Consts.DATA)) {
      return box.get(Consts.DATA);
    }
    else {
      return null;
    }
  }
}