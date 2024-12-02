import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/custom_widget/weather_widget.dart';

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

  static const weatherImages = {
    "CLOUDY": "assets/Images/forest_cloudy.png",
    "RAINY": "assets/Images/forest_rainy.png",
    "SUNNY": "assets/Images/forest_sunny.png",
  };

  static const backgroundColor = {
    "SUNNY": Color(0xff47ab2f),
    "CLOUDY": Color(0xff54717a),
    "RAINY": Color(0xff57575d)
  };

  @override
  Widget build(BuildContext context) {
    final weatherVM = Provider.of<WeatherViewModel>(context);

    String weatherCondition = "SUNNY";

    if (weatherVM.currentWeather != null) {
      String description = weatherVM.currentWeather!.description.toLowerCase();
      if (description.contains("sunny") || description.contains("clear")) {
        weatherCondition = "SUNNY";
      } else if (description.contains("rain") ||
          description.contains("drizzle")) {
        weatherCondition = "RAINY";
      } else if (description.contains("cloudy") ||
          description.contains("overcast")) {
        weatherCondition = "ClOUDY";
      }
    }

    Color? bgColor = backgroundColor[weatherCondition];

    return Scaffold(
        body: weatherVM.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : WeatherWidget(
                image: weatherImages[weatherCondition],
                tempareture: weatherVM.currentWeather?.temperature ?? 0.0,
                weatherCondition: weatherCondition,
                backgroundColor: bgColor ?? Colors.grey));
  }
}
