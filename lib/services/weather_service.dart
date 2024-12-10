import 'dart:convert';
import 'dart:developer';
import '../models/current_weather.dart';
import 'package:http/http.dart' as http;
import '../models/forecast.dart';

class WeatherService{
  final String apiKey = "0da73e70d1e541b3d6b385e6205f0e94";

  Future<CurrentWeather> fetchCurrentWeather(double lat, double lon)async{
    final url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey");

    final response = await http.get(url);
    if(response.statusCode == 200){
      return CurrentWeather.fromJson(jsonDecode(response.body)) ;
    }else{
      throw Exception('Failed to load current weather');
    }
  }

  Future<WeatherForecastResponse> fetchWeatherForecastResponse(double lat, double lon)async{
    final url = Uri.parse("https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey");

    final response = await http.get(url);
    log(response.body);
    if(response.statusCode == 200){
      log("========================${response.body}");
      return WeatherForecastResponse.fromJson(jsonDecode(response.body)) ;

    }else{
      throw Exception('Failed to load current weather');
    }
  }

}