import 'package:flutter/cupertino.dart';
import 'package:weather_app/screens/details/details_screen.dart';
import 'package:weather_app/screens/main/main_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getAppRoutes() {
    return {
      MainScreen.route: (_) => MainScreen(),
      DetailsScreen.route: (_) => DetailsScreen()
    };
  }
}