import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Returned Pass Data',
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String text = 'Some Text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 24),
              ),
            ),
            RaisedButton(
              child: Text(
                'Go to second screen',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                _returnDataFromSecondScreen(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _returnDataFromSecondScreen(BuildContext context) async {
    Route route = MaterialPageRoute(builder: (context) => SecondScreen());
    final result = await Navigator.push(context, route);

    setState(() {
      text = result;
    });
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: textFieldController,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          RaisedButton(
            child: Text(
              'Send text back',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              String textToSendBack = textFieldController.text;
              Navigator.pop(context, textToSendBack);
            },
          )
        ],
      ),
    );
  }
}