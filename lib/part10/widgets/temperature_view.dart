import 'package:flutter/material.dart';
import 'package:flutter_trainee_education/part10/model/weather_forecast_daily.dart';

class TemperatureView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TemperatureView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var icon = forecastList.first.getIconUrl();
    var temp = forecastList.first.temp.day.round();
    var description = forecastList.first.weather.first.description.toUpperCase();

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            icon,
            color: Colors.black87,
          ),
          SizedBox(width: 20),
          Column(
            children: <Widget>[
              Text(
                "$temp C",
                style: TextStyle(fontSize: 54, color: Colors.black87),
              ),
              Text(
                "$description",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
