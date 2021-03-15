import 'package:flutter/material.dart';
import 'package:weather_app/screens/main/main_screen_controller.dart';

class AddNewCityButton extends StatelessWidget {
  final MainScreenController screenController;

  const AddNewCityButton({Key key, this.screenController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => screenController.onAddCityButtonClick(context)
    );
  }
}
