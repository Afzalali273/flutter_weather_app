import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather.dart';

Future<Weather> fetchWeather(String apiKey) async {
  final response = await http.get(
    Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=25.1932024&lon=67.1554619&appid=$apiKey'),
  );

  if (response.statusCode == 200) {
    return Weather.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load weather data');
  }
}
