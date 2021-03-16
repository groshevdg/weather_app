import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_info.dart';

class ListStateProvider extends ChangeNotifier {
  List<WeatherInfo> _items;
  List<WeatherInfo> get items => _items;

  void updateAllList(List<WeatherInfo> list) {
    _items = list;
    notifyListeners();
  }

  void appendNewItem(WeatherInfo item) {
    _items.add(item);
    notifyListeners();
  }
}