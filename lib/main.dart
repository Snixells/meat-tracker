import 'package:flutter/material.dart';
import 'package:meattracker/shared/shared.dart';
import 'package:provider/provider.dart';
import './screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Firebase Analytics

      // Named Routes
      routes: {
        '/': (context) => BottomNavbar(),
        '/analytics': (context) => Analytics(),
        '/types': (context) => MeatTypes(),
      },
      theme: ThemeData(fontFamily: 'Nunito'),
    );
  }
}
