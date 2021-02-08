import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_trainee_education/part10/api/weather_api.dart';
import 'package:flutter_trainee_education/part10/model/weather_forecast_daily.dart';
import 'package:flutter_trainee_education/part10/screens/city_screen.dart';
import 'package:flutter_trainee_education/part10/widgets/bottom_weekly_weather_view.dart';
import 'file:///C:/FlutterApps/flutter_trainee_education/lib/part10/widgets/detail_view.dart';
import 'file:///C:/FlutterApps/flutter_trainee_education/lib/part10/widgets/temperature_view.dart';
import 'package:flutter_trainee_education/part10/widgets/city_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;

  const WeatherForecastScreen(this.locationWeather);

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> _forecastObject;
  var _cityName = "London";
  var _api = WeatherApi();

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      _forecastObject = Future.value(widget.locationWeather);
    } else {
      _forecastObject = _api.fetchWeatherForecast(city: _cityName, isCity: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: Text("openweathermap.org"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              _forecastObject = _api.fetchWeatherForecast();
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.location_city,
            ),
            onPressed: () async {
              var chosenCityNameName = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CityScreen()
                  )
              );
              if (chosenCityNameName != null) {
                setState(() {
                  _cityName = chosenCityNameName;
                  _forecastObject = _api.fetchWeatherForecast(city: _cityName, isCity: true);
                });
              }
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
              child: FutureBuilder<WeatherForecast>(
            future: _forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    CityView(snapshot: snapshot),
                    SizedBox(height: 50),
                    TemperatureView(snapshot: snapshot),
                    SizedBox(height: 50),
                    DetailView(snapshot: snapshot),
                    SizedBox(height: 50),
                    BottomWeeklyWeatherView(snapshot: snapshot)
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.active) {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 50),
                  child: SpinKitDoubleBounce(
                    color: Colors.black87,
                    size: 60,
                  ),
                );
              } else {
                return Center(
                  child: Text("Error"),
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
