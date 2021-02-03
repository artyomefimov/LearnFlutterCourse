import 'package:flutter/material.dart';

class SimpleRouting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Routing'),
          centerTitle: true,
        ),
        body: HomePage(),
      ),
      // initialRoute: "/page2",
      initialRoute: "/",
      routes: {
        "/page2": (context) => Page2()
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          // Simple
          // Route route = MaterialPageRoute(builder: (context) => Page2());
          // Navigator.push(context, route);

          // Named routing
          Navigator.pushNamed(context, "/page2");
        },
        child: Text('Move to Page 2'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
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
