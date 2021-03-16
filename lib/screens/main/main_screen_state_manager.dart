import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/screens/main/providers/list_provider.dart';

class MainScreenStateManager {
  final ListStateProvider _listProvider;

  MainScreenStateManager(this._listProvider);

  void updateUiState({
    List<WeatherInfo> data, // to show all list of the weather
    WeatherInfo addedCityWeatherInfo, // to append list of new city
  }) {
    if (data != null) {
      _listProvider.updateAllList(data);
    }

    if (addedCityWeatherInfo != null) {
      _listProvider.appendNewItem(addedCityWeatherInfo);
    }
  }
}