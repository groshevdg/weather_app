import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/config/strings.dart';
import 'package:weather_app/models/details_forecast.dart';
import 'package:weather_app/screens/details/providers/forecast_provider.dart';

class DetailsStateManager {
  final ForecastProvider forecastProvider;

  DetailsStateManager({@required this.forecastProvider});

  void updateUiState({
    List<DetailsForecast> data, // forecast to show
    bool shouldShowToast //show toast about cached data
  }) {
    if (data != null) {
        forecastProvider.updateForecast(data);
    }

    if (shouldShowToast != null) {
      Fluttertoast.showToast(msg: Strings.toast_message);
    }
  }
}