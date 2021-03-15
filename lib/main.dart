import 'package:flutter/material.dart';
import 'package:weather_app/config/app_routes.dart';
import 'package:weather_app/screens/main/main_screen.dart';

import 'config/app_theme.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getLightAppTheme(),
      routes: AppRoutes.getAppRoutes(),
      initialRoute: MainScreen.route,
    );
  }
}
