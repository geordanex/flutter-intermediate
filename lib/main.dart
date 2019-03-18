import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _value = 0.0;

  void _onChanged(double value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sliders'),
        ),
        body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Slider(value: _value, onChanged: _onChanged),
                new Container(
                  padding: EdgeInsets.all(32.0),
                  child: new LinearProgressIndicator(
                    value: _value,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ),
                new Container(
                  padding: EdgeInsets.all(32.0),
                  child: new CircularProgressIndicator(
                    value: _value,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
