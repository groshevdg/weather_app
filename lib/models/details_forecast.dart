import 'package:hive/hive.dart';

part 'details_forecast.g.dart';

@HiveType(typeId: 1)
class DetailsForecast {
  @HiveField(0)
  final String weather;
  @HiveField(1)
  final int temp;
  @HiveField(2)
  final int date;
  @HiveField(3)
  final String dateString;
  @HiveField(4)
  final String pressure;
  @HiveField(5)
  final String humidity;

  DetailsForecast({this.date, this.dateString, this.pressure, this.humidity, this.weather, this.temp});

  factory DetailsForecast.fromJson(Map<String, dynamic> json) => DetailsForecast(
    weather: json['weather'][0]['main'],
    temp: (json['main']['temp'] as double).toInt(),
    pressure: json['main']['pressure'].toString(),
    humidity: json['main']['humidity'].toString(),
    date: json['dt'] as int,
    dateString: json['dt_txt'].toString().split(" ")[0],
  );
}