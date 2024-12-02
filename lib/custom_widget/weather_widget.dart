import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final String? image;
  final double?tempareture;
  final String? weatherCondition;
  final Color? backgroundColor;

  WeatherWidget(
      {required this.image,
      required this.tempareture,
      required this.weatherCondition,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image!) , fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  "${tempareture!.toStringAsFixed(1)}°C",
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
                )
              ],
            ),
          ),
        )),
        Positioned.fill(
        top: MediaQuery.of(context).size.height * 0.5,
    child: Container(
      color: backgroundColor,
    )
    )
      ],
    );
  }
}
