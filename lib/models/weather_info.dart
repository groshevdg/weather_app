import 'package:hive/hive.dart';

part 'weather_info.g.dart';

@HiveType(typeId: 0)
class WeatherInfo extends HiveObject {
  @HiveField(0)
  final String cityName;
  @HiveField(1)
  final String temp;
  @HiveField(2)
  final String feelsLike;
  @HiveField(3)
  final String minTemp;
  @HiveField(4)
  final String maxTemp;
  @HiveField(5)
  final String skyState;

  WeatherInfo(
      {this.cityName,
      this.temp,
      this.feelsLike,
      this.minTemp,
      this.maxTemp,
      this.skyState});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      cityName: json['name'],
      temp: json['main']['temp'].toString(),
      feelsLike: json['main']['feels_like'].toString(),
      maxTemp: json['main']['temp_max'].toString(),
      minTemp: json['main']['temp_min'].toString(),
      skyState: json['weather'][0]['main'].toString(),
    );
  }
}