import 'dart:ui';

import 'package:flutter/material.dart';

class AssetHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "IndieFlower"
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Adding assets"),
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image(
                image: AssetImage("assets/bg.jpg"),
              ),
              Image.asset("assets/icon.png"),
              Positioned(
                top: 16,
                left: 115,
                child: Text(
                    "My custom font",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
