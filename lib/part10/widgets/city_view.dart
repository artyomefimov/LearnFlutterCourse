import 'package:flutter/material.dart';
import 'package:flutter_trainee_education/part10/model/weather_forecast_daily.dart';
import 'package:flutter_trainee_education/part10/utils/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const CityView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var city = snapshot.data.city.name;
    var country = snapshot.data.city.country;
    var dateTime = DateTime.fromMicrosecondsSinceEpoch(forecastList.first.dt);

    return Column(
      children: <Widget>[
        Text(
          "$city, $country",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black87),
        ),
        Text(
          "${Util.getFormattedDate(dateTime)}",
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
