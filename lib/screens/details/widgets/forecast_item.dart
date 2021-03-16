import 'package:flutter/material.dart';
import 'package:weather_app/config/app_theme.dart';
import 'package:weather_app/config/strings.dart';
import 'package:weather_app/models/details_forecast.dart';

class ForecastItem extends StatelessWidget {
  final DetailsForecast forecast;

  const ForecastItem({Key key, @required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20)
      ),
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: AppTheme.defaultMargin / 2),
      margin: EdgeInsets.symmetric(horizontal: AppTheme.defaultMargin / 2, vertical: AppTheme.defaultMargin / 2),
      child: Column (
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(forecast.dateString, style: Theme.of(context).textTheme.headline3),
          ),
          Expanded(
            child: Row(
              children: [
                Text("${Strings.pressure} ${forecast.pressure}", style: Theme.of(context).textTheme.headline3),
                Spacer(),
                Text("${Strings.humidity} ${forecast.humidity}%", style: Theme.of(context).textTheme.headline3),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Text("${Strings.temp} ${forecast.temp}°", style: Theme.of(context).textTheme.headline3),
                Spacer(),
                Text("${Strings.weather} ${forecast.weather}", style: Theme.of(context).textTheme.headline3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
