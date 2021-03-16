import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/config/strings.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/screens/main/providers/error_provider.dart';
import 'package:weather_app/screens/main/providers/list_provider.dart';
import 'package:weather_app/screens/main/providers/send_button_provider.dart';

class MainScreenStateManager {
  final ListStateProvider _listProvider;
  ErrorMessageProvider _errorMessageProvider;
  SendButtonStateProvider _buttonStateProvider;

  MainScreenStateManager(this._listProvider);

  void updateUiState({
    List<WeatherInfo> data, // to show all list of the weather
    WeatherInfo addedCityWeatherInfo, // to append list of new city
    Exception addNewCityException, // to show error message while adding new city
    bool shouldClearErrorMessage, // clears error message
    Exception initialLoadError, // to show toast about initial error
    bool isSendButtonClicked // change state of a send button
  }) {
    if (data != null) {
      _listProvider.updateAllList(data);
    }

    if (addedCityWeatherInfo != null) {
      _listProvider.appendNewItem(addedCityWeatherInfo);
    }

    if (addNewCityException != null) {
      _errorMessageProvider.updateErrorMessage();
    }

    if (shouldClearErrorMessage != null) {
      _errorMessageProvider.clearMessage();
    }

    if (initialLoadError != null) {
      Fluttertoast.showToast(msg: Strings.toast_message);
    }

    if (isSendButtonClicked != null) {
      _buttonStateProvider.updateButtonState(isSendButtonClicked);
    }
  }

  void updateDisposedProviders({
    ErrorMessageProvider errorMessageProvider,
    SendButtonStateProvider sendButtonStateProvider
  }) {
    _errorMessageProvider = errorMessageProvider;
    _buttonStateProvider = sendButtonStateProvider;
  }
}