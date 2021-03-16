import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/config/strings.dart';
import 'package:weather_app/screens/main/providers/list_provider.dart';
import 'package:weather_app/screens/main/widgets/list_item.dart';
import 'package:weather_app/screens/main/widgets/new_city_button.dart';

import 'main_screen_controller.dart';

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
                if (state.items == null) {
                  return Center(child: CircularProgressIndicator());
                }
                else if (state.items.isEmpty) {
                  return Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Spacer(),
                        Text(Strings.initial_load_error),
                        RaisedButton(onPressed: () => _screenController.onCreateScreen(), child: Text(Strings.retry)),
                        Spacer()
                      ],
                    ),
                  );
                }
                else {
                  return ListView.builder(itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        return WeatherListItem(
                            cityName: state.items[index].cityName,
                            temperature: state.items[index].temp);
                  });
                }
              })
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
