import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: null,
          ),
          iconTheme: IconThemeData(color: Colors.black54),
          brightness: Brightness.light,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: null,
            )
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _temperatureForecast(),
                Divider(),
                _footerRatings()
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _headerImage() {
  return Image(
    image: NetworkImage(
        "https://s7d2.scene7.com/is/image/TWCNews/0801_n13_chuluotaweatherjpg"),
    fit: BoxFit.cover,
  );
}

Widget _weatherDescription() {
  return Column(
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Tuesday - May 22",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Divider(),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque odio ligula, sagittis ut mi vel, tincidunt porttitor urna. Proin eu pretium diam. Curabitur gravida diam volutpat, fermentum nunc nec, accumsan odio.',
            style: TextStyle(color: Colors.black54),
          ),
        ],
      )
    ],
  );
}

Widget _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          )
        ],
      ),
      SizedBox(width: 16),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "15 Clear",
                style: TextStyle(color: Colors.deepPurple),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'Murmanskaya oblast, Murmans',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      )
    ],
  );
}

Widget _temperatureForecast() {
  return Wrap(
      spacing: 10,
      children: List.generate(7, (index) =>
          Chip(
            label: Text(
              "${index + 20} C",
              style: TextStyle(fontSize: 15),
            ),
            avatar: Icon(
              Icons.wb_cloudy,
              color: Colors.blue.shade300,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey[350])
            ),
            backgroundColor: Colors.grey.shade100,
          )
      ));
}

Widget _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.black),
      Icon(Icons.star, size: 15.0, color: Colors.black),
    ],
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text(
        'Info with openweathermap.org',
        style: TextStyle(fontSize: 15.0),
      ),
      stars
    ],
  );
}