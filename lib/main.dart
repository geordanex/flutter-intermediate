import 'package:flutter/material.dart';
import './customPopupMenu.dart';

void main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}

class _MyHomePageState extends State<MyHomePage> {
  List<MyItem> _items = new List<MyItem>();

  @override
  void initState() {
    for (var i = 0; i < 10; i++) {
      _items.add(
        new MyItem(
          false,
          'Item ${i}',
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Text('Hello World'),
          ),
        ),
      );
    }
  }

  ExpansionPanel _createItem(MyItem item) {
    return new ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return new Container(
            padding: EdgeInsets.all(5.0),
            child: new Text('Header ${item.header}'),
          );
        },
        body: item.body,
        isExpanded: item.isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Popup Menu Button'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new ListView(
          children: <Widget>[
            new ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _items[index].isExpanded = !_items[index].isExpanded;
                });
              },
              children: _items.map(_createItem).toList(),
            )
          ],
        ),
      ),
    );
  }
}
