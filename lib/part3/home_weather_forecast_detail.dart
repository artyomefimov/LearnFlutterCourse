import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherForecastDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            "Weather Forecast",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _searchField(),
                        _locationAndDate(),
                        _currentWeather(),
                        _weatherDetails(),
                        _furtherDaysWeather()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _searchField() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Icon(
        Icons.search,
        color: Colors.white,
      ),
      Text(
        "Enter City Name",
        style: TextStyle(color: Colors.white, fontSize: 12),
      )
    ],
  );
}

Widget _locationAndDate() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Murmansk Oblast, RU",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            "Friday, Mar 20, 2020",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

Widget _currentWeather() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 45),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.wb_sunny,
          color: Colors.white,
          size: 70,
        ),
        Column(
          children: <Widget>[
            Text(
              "14 F",
              style: TextStyle(fontSize: 46, color: Colors.white),
            ),
            Text(
              "LIGHT SNOW",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        )
      ],
    ),
  );
}

Widget _weatherDetails() {
  return Container(
    padding: const EdgeInsets.only(top: 45),
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: 24,
            ),
            Text(
              "5",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              "km/hr",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: 24,
            ),
            Text(
              "3",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              "%",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: 24,
            ),
            Text(
              "20",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              "%",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _furtherDaysWeather() {
  return Padding(
    padding: const EdgeInsets.only(top: 45),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(
            "7-DAY WEATHER FORECAST",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 110,
          child: ListView(
            padding: EdgeInsets.only(top: 16),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              _listItem("Friday", "6 F"),
              _listItem("Saturday", "5 F"),
              _listItem("Sunday", "6 F"),
              _listItem("Monday", "7 F"),
              _listItem("Tuesday", "8 F"),
              _listItem("Wednesday", "9 F"),
              _listItem("Thursday", "10 F", icon: Icons.ac_unit),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _listItem(String dayOfWeek, String degrees,
    {IconData icon = Icons.wb_sunny}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 6),
    padding: EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 16),
    width: 140,
    height: 40,
    color: Colors.white70,
    child: Column(
      children: <Widget>[
        Text(
          dayOfWeek,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                degrees,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  icon,
                  size: 26,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
