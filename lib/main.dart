import 'package:flutter/material.dart';
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
        '/': (context) => TrackMeat(),
      },
    );
  }
}
