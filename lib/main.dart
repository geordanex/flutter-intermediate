import 'package:flutter/material.dart';
import './customPopupMenu.dart';

void main() =>
    runApp(MaterialApp(title: 'Popup Menu Button', home: MyHomePage()));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(title: 'Home', icon: Icons.home),
  CustomPopupMenu(title: 'Bookmarks', icon: Icons.bookmark),
  CustomPopupMenu(title: 'Settings', icon: Icons.settings),
];

class _MyHomePageState extends State<MyHomePage> {
  CustomPopupMenu _selectedChoices = choices[0];

  void _select(CustomPopupMenu choice) =>
      setState(() => _selectedChoices = choice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Popup Menu Button'),
        actions: <Widget>[
          PopupMenuButton<CustomPopupMenu>(
            elevation: 3.2,
            initialValue: choices[1],
            onCanceled: () {
              print("You have not chossed anything");
            },
            tooltip: "This is a tooltip",
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem<CustomPopupMenu>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          )
        ],
      ),
      body: bodyWidget(),
    );
  }

  bodyWidget() {
    return Container(
      color: Colors.tealAccent,
      child: SelectedOption(
        choice: _selectedChoices,
      ),
    );
  }
}
