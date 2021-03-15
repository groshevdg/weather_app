import 'package:flutter/material.dart';
import 'package:weather_app/config/strings.dart';
import 'package:weather_app/screens/main/main_screen_controller.dart';
import 'package:weather_app/screens/main/widgets/list_item.dart';
import 'package:weather_app/screens/main/widgets/new_city_button.dart';

class MainScreen extends StatefulWidget {
  static const route = "main";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenController _screenController = MainScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.app_name),
      ),
      body: Stack(
        children: [
          ListView.builder(itemBuilder: (context, index) {
            return WeatherListItem(cityName: "city", iconUrl: "url", temperature: "15");
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: AddNewCityButton(screenController: _screenController)),
          )
        ],
      ),
    );
  }
}
