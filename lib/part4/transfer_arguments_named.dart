import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstHome(),
    routes: {
      "/first": (context) => FirstHome(),
      "/second": (context) => SecondHome()
    },
  ));
}

class FirstHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Home'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            User user = User(name: "Name", age: 24);

            Navigator.pushNamed(
              context,
              "/second",
              arguments: user
            );
          },
          child: Text('Second Home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  User user;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    user = settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user.name} - ${this.user.age}'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User({this.name, this.age});
}