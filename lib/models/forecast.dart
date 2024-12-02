class Forecast{
  final DateTime date;
  final double temperature;
  final String description;
  final String icon;

  Forecast({
    required this.date,
    required this.temperature,
    required this.description,
    required this.icon});

  factory Forecast.fromJson(Map<String, dynamic> json){
    return Forecast(
        date: DateTime.fromMicrosecondsSinceEpoch(json['dt'] * 1000),
        temperature: json['main']['temp'].toDouble(),
        description: json['weather'][0]['description'],
        icon: json['weather'][0]['icon']);
  }
}

class WeatherForecastResponse{
  final List<Forecast> forecastList;

  WeatherForecastResponse({required this.forecastList});

  factory WeatherForecastResponse.fromJson(Map<String, dynamic> json){
    List<Forecast> forecastList = (json['list'] as List)
        .map((item) => Forecast.fromJson(item))
        .toList();
    return WeatherForecastResponse(forecastList: forecastList);
  }
}