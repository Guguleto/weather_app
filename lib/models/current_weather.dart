class CurrentWeather {
  final String cityName;
  final String main;
  final double temperature;
  final String description;
  final String icon;
  final double min;
  final double max;


  CurrentWeather({
    required this.main,
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.icon, required this.min, required this.max});

  factory CurrentWeather.fromJson(Map<String, dynamic> json){
    return CurrentWeather(
        cityName: json['name']?? 'unknown',
        min: json['main']['temp_min'].toDouble() ??0.0,
        max:json['main']['temp_max'].toDouble() ??0.0,
        main: json['weather'][0]['main']?? 'unknown',
        temperature: json['main']['temp'].toDouble()??0.0,
        description: json['weather'][0]['description']?? 'unknown',
        icon: json['weather'][0]['icon']?? 'unknown');

  }
}