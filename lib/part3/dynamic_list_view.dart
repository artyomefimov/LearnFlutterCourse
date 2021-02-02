import 'package:flutter/material.dart';

class DynamicListView extends StatelessWidget {
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
  final List<ListItem> items = List<ListItem>.generate(
      10000,
      (index) {
        return index % 6 == 0
            ? HeadingItem("Heading $index")
            : MessageItem("Sender $index", "MessageBody $index");
      });

  return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        if (item is HeadingItem) {
          return ListTile(
            title: Text(item.heading, style: Theme.of(context).textTheme.headline5,),
          );
        } else if (item is MessageItem) {
          return ListTile(
            title: Text(item.sender),
            subtitle: Text(item.messageBody),
            leading: Icon(Icons.insert_photo, color: Colors.red,),
            trailing: Icon(Icons.keyboard_arrow_right),
          );
        }
        return null;

        // Card(
        // child: ListTile(
        // title: Text("${items[index]}"),
        // leading: Icon(
        // Icons.insert_photo,
        // color: Colors.red,
        // ),
        // trailing: Icon(
        // Icons.keyboard_arrow_right,
        // ),
        // ),
        // )
      });
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String messageBody;

  MessageItem(this.sender, this.messageBody);
}