class Forecast{
  final DateTime date;
  final double temperature;
  final String main;


  Forecast({
    required this.date,
    required this.temperature,
    required this.main
   });

  factory Forecast.fromJson(Map<String, dynamic> json){
    return Forecast(
        date: DateTime.parse(json['dt_txt']),
      main: json['weather'][0]['main']?? 'unknown',
        temperature: json['main']['temp'].toDouble(),);

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