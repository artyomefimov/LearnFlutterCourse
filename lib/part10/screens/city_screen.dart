import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8),
              child: TextField(
                cursorColor: Colors.blueGrey[800],
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter city name",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black87,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none
                  ),
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.black87,
                    size: 50,
                  ),
                ),
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
            FlatButton(
              child: Text(
                "Get weather",
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                Navigator.pop(context, cityName);
              },
            )
          ],
        ),
      ),
    );
  }
}
