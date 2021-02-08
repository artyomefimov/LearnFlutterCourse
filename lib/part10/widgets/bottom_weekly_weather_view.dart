import 'package:flutter/material.dart';
import 'package:flutter_trainee_education/part10/model/weather_forecast_daily.dart';
import 'package:flutter_trainee_education/part10/utils/forecast_util.dart';

class BottomWeeklyWeatherView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const BottomWeeklyWeatherView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "7-DAY WEATHER FORECAST",
          style: TextStyle(
              fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.all(16),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: MediaQuery.of(context).size.width / 2.7, // 2/7 ширины экрана
                height: 160,
                color: Colors.black87,
                child: _forecastCard(snapshot, index),
              ),
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: snapshot.data.list.length),
        )
      ],
    );
  }

  Widget _forecastCard(AsyncSnapshot snapshot, int index) {
    var forecastList = snapshot.data.list;
    var date = DateTime.fromMicrosecondsSinceEpoch(forecastList[index].dt * 1000);
    var fullDate = Util.getFormattedDate(date);
    var dayOfWeek = fullDate.split(',').first; // Tue
    var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
    var icon = forecastList[index].getIconUrl();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              dayOfWeek,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$tempMin °C',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            Image.network(icon, scale: 1.2),
          ],
        )
      ],
    );
  }
}
