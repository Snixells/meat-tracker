import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meattracker/screens/screens.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final _pageOptions = [TrackMeat(), Analytics(), MeatTypes()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.plusSquare, size: 20),
            title: Text(
              'Track Meat',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Nunito'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.chartBar, size: 20),
            title: Text(
              'Analytics',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Nunito'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bacon, size: 20),
            title: Text(
              'Meat Types',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Nunito'),
            ),
          ),
        ].toList(),
        // fixedColor: Colors.deepOrange[200],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
      ),
    );
  }
}
