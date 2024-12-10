import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';

import '../constant.dart';

class WeatherWidget extends StatelessWidget {
  final String? image;
  final double? tempareture;
  final double? temp;
  final String? weatherCondition;
  final Color? backgroundColor;
  final double? min;
  final double? max;
  final List<Forecast> forecastList;


  WeatherWidget(
      {required this.image,
      required this.tempareture,
      required this.weatherCondition,
      required this.backgroundColor,
      required this.max,
      required this.min,
      required this.temp,
        required this.forecastList,

      });

  String getDayOfWeek(int weekday){
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday','Friday', 'Saturday', 'Sunday'];
    return days [weekday - 1];
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
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  image!,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Text(
                    "${(tempareture! - 273.15).toInt()}°",
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weatherCondition!.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "${(min! - 273.15).toInt()}°",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    const Text(
                      'min',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      "${(temp! - 273.15).toInt()}°",
                      style:
                          const TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    const Text(
                      'current',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      "${(max! - 273.15).toInt()}°",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    const Text(
                      'max',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(),

          Expanded(
            child: ListView.builder(
                itemCount: groupForecastsByDay(forecastList).length,
                itemBuilder: (context, index) {
                  final groupedForecast = groupForecastsByDay(forecastList).values.toList();
                  final forecast = groupedForecast[index];
                  final forecastTemp = "${(forecast.temperature - 273.15).toInt()}°";
                  final dayOfWeek = getDayOfWeek(forecast.date.toLocal().weekday);

                  String weatherCondition = 'SUNNY';
                    String description = forecast.main.toLowerCase();
                    if (description == 'clear') {
                      weatherCondition = "SUNNY";
                    } else if (description == 'rain') {
                      weatherCondition = "RAINY";
                    } else if (description == 'clouds') {
                      weatherCondition = "CLOUDY";
                    }

                  return Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10),
                    child: Row(
                      children: [
                        Text(dayOfWeek,
                            style: const TextStyle(fontSize: 14.0, color: Colors.white)),
                        const Spacer(),
                        Image.asset(Constants.icons[weatherCondition] ??"assets/Icons/clear@3x.png")
                        ,
                        const SizedBox(width: 130,),
                        Text(forecastTemp,
                            style: const TextStyle(fontSize: 14.0, color: Colors.white)),
                      ],

                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
