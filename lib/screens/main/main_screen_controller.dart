import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/main/main_screen_state_manager.dart';
import 'package:weather_app/screens/main/providers/list_provider.dart';
import 'package:weather_app/screens/main/widgets/new_city_sheet.dart';
import 'package:weather_app/usecase/usecase.dart';

class MainScreenController {
  final UseCase _useCase = UseCase();
  final ListStateProvider _listStateProvider;
  MainScreenStateManager _stateManager;

  MainScreenController(this._listStateProvider) {
    _stateManager = MainScreenStateManager(_listStateProvider);
  }

  void onListItemClick() {

  }

  void onAddCityButtonClick(BuildContext context) {
    Scaffold.of(context).showBottomSheet((context) => AddNewCityBottomSheet(controller: this));
  }

  void onSubmitButtonClick(BuildContext context, String city) async {
    var result = await _useCase.getWeatherByCity(city);
    if (result.isSuccessful) {
      _stateManager.updateUiState(addedCityWeatherInfo: result.data);
      Navigator.pop(context);
    }
    else {
      // todo show error message
    }
  }

  void onCreateScreen() async {
   var result = await _useCase.initialLoad();
   if (result.isSuccessful) {
     _stateManager.updateUiState(data: result.data);
   }
   else {
     // todo show error message
   }
  }
}