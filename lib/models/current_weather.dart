class CurrentWeather {
  final String cityName;
  final double temperature;
  final String description;
  final String icon;

  CurrentWeather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.icon});

  factory CurrentWeather.fromJson(Map<String, dynamic> json){
    return CurrentWeather(
        cityName: json['name'],
        temperature: json['main']['temp'].toDouble(),
        description: json['weather'][0]['description'],
        icon: json['weather'][0]['icon']);
  }
}