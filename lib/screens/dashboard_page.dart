import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/custom_widget/weather_widget.dart';
import 'package:weather_app/models/forecast.dart';

import '../constant.dart';
import '../view_model/weather_view_model.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({
    super.key,
  });

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final weatherVM = Provider.of<WeatherViewModel>(context, listen: false);
      weatherVM.getCurrentLocationWeather();
    });
  }



  Map<String, Forecast> groupForecastsByDay(List<Forecast> forecasts){
    final Map<String, Forecast> groupedForecasts = {};

    for( var forecast in forecasts){
      final dateKey = forecast.date.toLocal().toString().split(' ')[0];
      if(!groupedForecasts.containsKey(dateKey)){
        groupedForecasts[dateKey] = forecast;
      }
    }

    return groupedForecasts;
  }

  @override
  Widget build(BuildContext context) {
    final weatherVM = Provider.of<WeatherViewModel>(context);
    final forecastList = weatherVM.weatherForecast?.forecastList ?? [];

    String weatherCondition = "SUNNY";

    if (weatherVM.currentWeather != null) {
      String description = weatherVM.currentWeather!.main.toLowerCase();
      if (description == 'clear') {
        weatherCondition = "SUNNY";
      } else if (description == 'rain') {
        weatherCondition = "RAINY";
      } else if (description == 'clouds') {
        weatherCondition = "CLOUDY";
      }
    }

    Color? bgColor = Constants.backgroundColor[weatherCondition];

    return Scaffold(
        body: weatherVM.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : WeatherWidget(
                temp: weatherVM.currentWeather?.temperature ?? 0.0,
                max: weatherVM.currentWeather?.max ?? 0.0,
                min: weatherVM.currentWeather?.min ?? 0.0,
                image: Constants.weatherImages[weatherCondition] ??
                    "assets/Images/forest_sunny.png",
                tempareture: weatherVM.currentWeather?.temperature ?? 0.0,
                weatherCondition: weatherCondition,
                backgroundColor: bgColor ?? Colors.grey,
                forecastList: weatherVM.weatherForecast?.forecastList ?? [],
              ));
  }
}
