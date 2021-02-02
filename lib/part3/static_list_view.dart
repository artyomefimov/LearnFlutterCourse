import 'package:flutter/material.dart';

class StaticListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Building List View'),
          centerTitle: true,
        ),
        body: BodyListView(),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  return ListView(
    padding: EdgeInsets.all(8),
    // shrinkWrap: true,
    scrollDirection: Axis.vertical,
    // itemExtent: 300, 
    reverse: true,
    children: <Widget>[
      ListTile(
        title: Text("Sun"),
        subtitle: Text("Today clear"),
        leading: Icon(Icons.wb_sunny),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        title: Text("Cloudy"),
        subtitle: Text("Today clear"),
        leading: Icon(Icons.wb_cloudy),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        title: Text("Snow"),
        subtitle: Text("Today clear"),
        leading: Icon(Icons.ac_unit),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    ],
  );
}
