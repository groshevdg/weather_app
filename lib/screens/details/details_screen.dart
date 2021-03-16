import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/config/strings.dart';
import 'package:weather_app/screens/details/details_controller.dart';
import 'package:weather_app/screens/details/providers/forecast_provider.dart';
import 'package:weather_app/screens/details/widgets/forecast_item.dart';

class DetailsScreen extends StatefulWidget {
  static const route = "details";

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String cityName;
  DetailsController controller;
  ForecastProvider forecastProvider = ForecastProvider();

  @override
  void initState() {
    controller = DetailsController(forecastProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cityName = ModalRoute.of(context).settings.arguments;
    controller.getWeatherForecast(cityName);
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
      ),
      body: ChangeNotifierProvider(
        create: (_) => forecastProvider,
        child: Consumer<ForecastProvider>(
          builder: (context, state, child) {
            if (state.items == null) {
              return Center(child: CircularProgressIndicator());
            } else if (state.items.isEmpty) {
              return Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Spacer(),
                    Text(Strings.initial_load_error),
                    RaisedButton(
                        child: Text(Strings.retry),
                        onPressed: () => controller.getWeatherForecast(cityName)),
                    Spacer()
                  ],
                ),
              );
            }
            else {
              return ListView.builder(itemCount: state.items.length,
                  itemBuilder: (BuildContext context, int index) => ForecastItem(forecast: state.items[index]),
            );
            }
          },
        ),
      ),
    );
  }
}
