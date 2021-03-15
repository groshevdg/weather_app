import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/main/widgets/new_city_sheet.dart';

class MainScreenController {

  void onListItemClick() {

  }

  void onAddCityButtonClick(BuildContext context) {
    Scaffold.of(context).showBottomSheet((context) => AddNewCityBottomSheet());
  }

  void onSubmitButtonClick() {

  }
}