class WeatherInfo {
  final String cityName;
  final String temp;
  final String feelsLike;
  final String minTemp;
  final String maxTemp;
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