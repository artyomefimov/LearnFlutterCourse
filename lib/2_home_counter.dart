import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counterValue;

  @override
  void initState() {
    super.initState();
    _counterValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text((Counter).toString()),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.blueGrey,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Tap \"-\" to decrement",
                style: TextStyle(color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.minimize,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _updateCounterValue(Operation.DECREMENT);
                        });
                      },
                    ),
                    Text(
                      "$_counterValue",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.control_point,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _updateCounterValue(Operation.INCREMENT);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Text(
                "Tap \"+\" to increment",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _updateCounterValue(Operation operation) {
    switch (operation) {
      case Operation.INCREMENT:
        _counterValue++;
        break;
      case Operation.DECREMENT:
        if (_counterValue > 0) _counterValue--;
        break;
    }
  }
}

enum Operation { INCREMENT, DECREMENT }
