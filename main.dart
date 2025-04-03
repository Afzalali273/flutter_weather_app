import 'package:flutter/material.dart';
import 'weather.dart';
import 'weather_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    // Replace 'YOUR_API_KEY' with your actual OpenWeatherMap API Key
    futureWeather = fetchWeather('3077949625ed2cfe8097324803b9a2e5');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: FutureBuilder<Weather>(
          future: futureWeather,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              Weather weather = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'City: ${weather.cityName}',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Current Temp: ${weather.currentTemperature.toStringAsFixed(1)}°C',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'High Temp: ${weather.highTemperature.toStringAsFixed(1)}°C',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Low Temp: ${weather.lowTemperature.toStringAsFixed(1)}°C',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Description: ${weather.description}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              );
            } else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }
}
