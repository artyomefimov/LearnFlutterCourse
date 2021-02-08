import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_trainee_education/part10/api/weather_api.dart';
import 'package:flutter_trainee_education/part10/screens/weather_forecast_screen.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var _api = WeatherApi();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.black87,
            size: 70,
          ),
        ),
      ),
    );
  }

  void getLocationData() async {
    var weatherInfo = _api.fetchWeatherForecast();

    if (weatherInfo == null) {
      print("Weather info was null");
      return;
    }

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WeatherForecastScreen(weatherInfo)));
  }
}
