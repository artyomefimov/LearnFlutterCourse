import 'dart:async';

import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {

  @override
  State createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  bool _loading;
  double _progressValue;
  String _downloadingText;
  String _notDownloadingText;

  @override
  void initState() {
    super.initState();

    _loading = false;
    _progressValue = 0.0;
    _downloadingText = "Идет загрузка...";
    _notDownloadingText = "Нажмите кнопку для начала загрузки";
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text("Loading Indicator"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LinearProgressIndicator(
                  value: _progressValue,
                  backgroundColor: Colors.amberAccent,
                ),
                Text(
                  "${(_progressValue * 100).round()}%",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Container(
                  child: Text(
                    _loading ? _downloadingText : _notDownloadingText,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  alignment: Alignment.center,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          child: Icon(
              Icons.file_download
          ),
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      setState(() {
        _progressValue += 0.2;

        if (_progressValue.toStringAsFixed(1) == "1.0") {
          _loading = false;
          _progressValue = 0.0;
          timer.cancel();
        }
      });
    });
  }
}
