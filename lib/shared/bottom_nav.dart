import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavbar extends StatefulWidget {
  BottomNavbar({Key key}) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      ].toList(),
      fixedColor: Colors.deepOrange[200],
      onTap: (int idx) {
        switch (idx) {
          case 0:
            break;
          case 1:
            Navigator.pushNamed(context, '/analytics');
            break;
          case 2:
            Navigator.pushNamed(context, '/types');
            break;
        }
      },
    );
  }
}
