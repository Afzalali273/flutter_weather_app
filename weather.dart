class Weather {
  final double currentTemperature;
  final double highTemperature;
  final double lowTemperature;
  final String description;
  final String cityName;

  Weather({
    required this.currentTemperature,
    required this.highTemperature,
    required this.lowTemperature,
    required this.description,
    required this.cityName,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      currentTemperature: json['main']['temp'] - 273.15,
      highTemperature: json['main']['temp_max'] - 273.15,
      lowTemperature: json['main']['temp_min'] - 273.15,
      description: json['weather'][0]['description'],
      cityName: json['name'],
    );
  }
}
