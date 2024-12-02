
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

import '../models/current_weather.dart';
import '../models/forecast.dart';
import '../services/weather_service.dart';


class WeatherViewModel extends ChangeNotifier{
  final WeatherService _weatherService = WeatherService();
  CurrentWeather? currentWeather;
  WeatherForecastResponse? weatherForecast;
  bool isLoading = false;

  Future<void> getCurrentWeather(double lat, double lon) async{
    isLoading = true;
    notifyListeners();

    try{
      currentWeather = await _weatherService.fetchCurrentWeather(lat, lon);
      isLoading = false;
    }catch (e){
      isLoading = false;
      rethrow;
    }
    notifyListeners();
  }

  Future<void> getWeatherForecast(double lat, double lon)async{
    isLoading = true;
    notifyListeners();

    try{
      weatherForecast = await _weatherService.fetchWeatherForecastResponse(lat, lon);
      isLoading = false;
    }catch (e){
      isLoading =  false;
      rethrow;
    }
    notifyListeners();
  }

  Future<void>getCurrentLocationWeather() async {
    isLoading = true;
    notifyListeners();

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('location service disabled');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('location service permanently denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
            'location service permanently denied. Enable them in settings');
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      await getCurrentWeather(position.latitude, position.longitude);
    } catch (e) {
      debugPrint('Error: $e');
      isLoading = false;
      rethrow;
    }finally{

    isLoading = false;
    notifyListeners();
  }
  }


}
