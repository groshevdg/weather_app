import 'package:flutter/material.dart';
import 'package:weather_app/config/app_theme.dart';

class WeatherListItem extends StatelessWidget {
  final String cityName;
  final String temperature;

  const WeatherListItem({Key key,
    @required this.cityName,
    @required this.temperature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.only(left: AppTheme.defaultMargin),
            child: Text(cityName, style: Theme.of(context).textTheme.headline3),
          ),
          Container(
            margin: EdgeInsets.only(right: AppTheme.defaultMargin),
            child: Text(temperature, style: Theme.of(context).textTheme.headline3),
          ),
        ],
      ),
    );
  }
}
