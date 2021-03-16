import 'package:weather_app/screens/details/details_state_manager.dart';
import 'package:weather_app/screens/details/providers/forecast_provider.dart';
import 'package:weather_app/usecase/usecase.dart';

class DetailsController {
  final UseCase _useCase = UseCase();
  final ForecastProvider _forecastProvider;
  DetailsStateManager _stateManager;

  DetailsController(this._forecastProvider) {
    _stateManager = DetailsStateManager(forecastProvider: _forecastProvider);
  }

  void getWeatherForecast(String cityName) async {
    var result = await _useCase.getForecastForFiveDays(cityName);
    if (result.isSuccessful) {
      _stateManager.updateUiState(data: result.data);
    }
    else {
      _stateManager.updateUiState(data: result.data ?? []);
      if (result.data != null) {
        // toast about cache
      }
    }
  }
}