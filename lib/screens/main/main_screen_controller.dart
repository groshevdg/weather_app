import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/details/details_screen.dart';
import 'package:weather_app/screens/main/main_screen_state_manager.dart';
import 'package:weather_app/screens/main/providers/error_provider.dart';
import 'package:weather_app/screens/main/providers/list_provider.dart';
import 'package:weather_app/screens/main/providers/send_button_provider.dart';
import 'package:weather_app/screens/main/widgets/new_city_sheet.dart';
import 'package:weather_app/usecase/usecase.dart';

class MainScreenController {
  final UseCase _useCase = UseCase();
  final ListStateProvider _listStateProvider;
  MainScreenStateManager _stateManager;

  MainScreenController(this._listStateProvider) {
    _stateManager = MainScreenStateManager(_listStateProvider);
  }

  void onListItemClick(BuildContext context, String cityName) {
    Navigator.of(context).pushNamed(DetailsScreen.route, arguments: cityName);
  }

  void onAddCityButtonClick(BuildContext context) {
    var _errorMessageProvider = ErrorMessageProvider();
    var _buttonStateProvider = SendButtonStateProvider();
    _stateManager.updateDisposedProviders(errorMessageProvider: _errorMessageProvider, sendButtonStateProvider: _buttonStateProvider);
    Scaffold.of(context).showBottomSheet((context) => AddNewCityBottomSheet(
      controller: this,
      errorMessageProvider: _errorMessageProvider,
      buttonStateProvider: _buttonStateProvider)
    );
  }

  void onSubmitButtonClick(BuildContext context, String city) async {
    _stateManager.updateUiState(shouldClearErrorMessage: true, isSendButtonClicked: true);
    var result = await _useCase.getWeatherByCity(city);
    if (result.isSuccessful) {
      _stateManager.updateUiState(addedCityWeatherInfo: result.data, isSendButtonClicked: false);
      Navigator.pop(context);
    }
    else {
      _stateManager.updateUiState(addNewCityException: result.exception, isSendButtonClicked: false);
    }
  }

  void onCreateScreen() async {
   var result = await _useCase.initialLoad();
   if (result.isSuccessful) {
     _stateManager.updateUiState(data: result.data);
   }
   else {
     _stateManager.updateUiState(data: result.data ?? List.empty());
     if (result.data != null) {
       _stateManager.updateUiState(initialLoadError: result.exception);
     }
   }
  }
}