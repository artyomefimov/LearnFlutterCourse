import 'package:flutter/material.dart';
import 'package:flutter_trainee_education/part10/model/weather_forecast_daily.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const DetailView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var pressure = (forecastList.first.pressure * 0.750062).round();
    var humidity = forecastList.first.humidity;
    var windSpeed = forecastList.first.speed.round();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          getItem(FontAwesomeIcons.thermometerThreeQuarters, pressure, "mm Hg"),
          getItem(FontAwesomeIcons.cloudRain, humidity, "%"),
          getItem(FontAwesomeIcons.wind, windSpeed, "m/s"),
        ],
      ),
    );
  }

  getItem(IconData iconData, int value, String units) {
    return Column(
      children: <Widget>[
        Icon(iconData, color: Colors.black87, size: 28.0),
        SizedBox(height: 10.0),
        Text(
          '$value',
          style: TextStyle(fontSize: 20.0, color: Colors.black87),
        ),
        SizedBox(height: 10.0),
        Text(
          '$units',
          style: TextStyle(fontSize: 15.0, color: Colors.black87),
        ),
      ],
    );
  }
}
