import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/main/widgets/new_city_sheet.dart';
import 'package:weather_app/screens/usecase/usecase.dart';

class MainScreenController {
  final UseCase _useCase = UseCase();

  void onListItemClick() {

  }

  void onAddCityButtonClick(BuildContext context) {
    Scaffold.of(context).showBottomSheet((context) => AddNewCityBottomSheet(controller: this));
  }

  void onSubmitButtonClick() {
    _useCase.getWeatherByCity("Moscow");
  }

  void onCreateScreen() async {
    var requests = <Future>[];
    requests.add(_useCase.getWeatherByCity("Moscow"));
    requests.add(_useCase.getWeatherByCity("Taganrog"));
    requests.add(_useCase.getWeatherByCity("Rostov"));

    var response = await Future.wait(requests);
  }
}