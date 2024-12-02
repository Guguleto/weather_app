import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/dashboard_page.dart';
import 'package:weather_app/view_model/weather_view_model.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> WeatherViewModel())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DashBoardPage(),
    );
  }
}
