import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AnimateViaProvider());

class AnimateViaProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MultiProvider(
          providers: [
        ChangeNotifierProvider<ColorProvider>.value(value: ColorProvider()),
      ], child: Body()),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ColorProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Let's animate",
          style: TextStyle(color: provider.appBarColor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              color: provider.containerColor,
              duration: Duration(seconds: 1),
              curve: Curves.elasticInOut,
              child: SizedBox(
                width: 150,
                height: 150,
              ),
            ),
            Switch(
              value: provider.switchState,
              onChanged: (newValue) => provider._changeColor(newValue),
            )
          ],
        ),
      ),
    );
  }
}

class ColorProvider extends ChangeNotifier {
  Color _containerColor = Colors.red;
  Color _appBarColor = Colors.green;
  bool _switchState = false;

  final _random = Random();
  final opaqueAlpha = 255;

  Color get containerColor => _containerColor;
  Color get appBarColor => _appBarColor;
  bool get switchState => _switchState;

  void _changeColor(bool newValue) {
    _switchState = newValue;
    _containerColor = Color.fromARGB(opaqueAlpha, _random.nextInt(255),
        _random.nextInt(255), _random.nextInt(255));
    _appBarColor = Color.fromARGB(opaqueAlpha, _random.nextInt(255),
        _random.nextInt(255), _random.nextInt(255));
    notifyListeners();
  }
}
