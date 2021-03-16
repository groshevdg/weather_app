import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/config/strings.dart';
import 'package:weather_app/screens/main/main_screen_controller.dart';
import 'package:weather_app/screens/main/providers/list_provider.dart';
import 'package:weather_app/screens/main/widgets/list_item.dart';
import 'package:weather_app/screens/main/widgets/new_city_button.dart';

class MainScreen extends StatefulWidget {
  static const route = "main";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ListStateProvider _listStateProvider = ListStateProvider();
  MainScreenController _screenController;

  @override
  void initState() {
    _screenController = MainScreenController(_listStateProvider);
    _screenController.onCreateScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.app_name),
      ),
      body: Stack(
        children: [
          ChangeNotifierProvider(
            create: (_) => _listStateProvider,
            child: Consumer<ListStateProvider>(
              builder: (context, state, child) {
                return state.items == null ? Center(child: CircularProgressIndicator())
                : ListView.builder(itemCount: state.items.length, itemBuilder: (context, index) {
                  return WeatherListItem(cityName: state.items[index].cityName, iconUrl: "url", temperature: state.items[index].temp);
                });
              },
            )
          ),
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
