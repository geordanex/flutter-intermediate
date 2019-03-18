import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _value = 'Nothing yet';

  void _onPressed() => setState(() => _value = new DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Name here'),
        ),
        body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text(_value),
                new IconButton(
                  icon: new Icon(Icons.timer),
                  onPressed: _onPressed,
                  tooltip: 'Click me',
                )
              ],
            ),
          ),
        ));
  }
}
