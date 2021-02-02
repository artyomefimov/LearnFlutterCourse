import 'package:flutter/material.dart';

class ExpandedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text((ExpandedExample).toString()),),
        body: Row(
          children: <Widget>[
            Expanded( // позволяет обрезать слишком большие изображения под размер Row и flex
              flex: 2,
              child: Image.network(
                  "https://glimmernet.com/wp-content/uploads/2019/02/clip-path-example-bg.jpg"
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.red,
                child: Text("1"),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.green,
                child: Text("2"),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.blue,
                child: Text("3"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
