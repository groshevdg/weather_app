import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/details_forecast.dart';

class ForecastProvider extends ChangeNotifier {
  List<DetailsForecast> _data;
  List<DetailsForecast> get items => _data;

  void updateForecast(List<DetailsForecast> list) {
    _data = list;
    notifyListeners();
  }
}