import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/config/app_routes.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/screens/main/main_screen.dart';

import 'config/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getExternalStorageDirectory();
  await Hive
    ..registerAdapter(WeatherInfoAdapter())
    ..init(directory.path);
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
