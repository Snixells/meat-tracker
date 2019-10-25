import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meattracker/screens/analytics.dart';
import 'package:meattracker/screens/track.dart';
import 'package:meattracker/screens/types.dart';

class BottomNavbar extends StatefulWidget {
  BottomNavbar({Key key}) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 2;

  final _pageOptions = [TrackMeat(), Analytics(), MeatTypes()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TrackMeat(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.plusSquare, size: 20),
            title: Text('Track Meat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.chartBar, size: 20),
            title: Text('Analytics'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bacon, size: 20),
            title: Text('Meat Types'),
          ),
        // ].toList(),
        ].toList(),
        // fixedColor: Colors.deepOrange[200],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
