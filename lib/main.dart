import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meattracker/screens/home/addMeat.dart';
import 'package:meattracker/screens/profile.dart';
import 'package:meattracker/screens/wrapper.dart';
import 'package:meattracker/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        // Named Routes
        routes: {
          '/': (context) => Wrapper(),
          '/add': (context) => AddMeat(),
          '/profile': (context) => Profile(),
        },
        theme: ThemeData(
          backgroundColor: Colors.blue,
          canvasColor: Color.fromRGBO(240, 240, 240, 1),
          fontFamily: 'Nunito',
          accentColor: Color.fromRGBO(46, 204, 113, 1),
          primaryColor: Color.fromRGBO(52, 152, 219, 1),
          errorColor: Color.fromRGBO(231, 76, 60,1.0),
          appBarTheme: AppBarTheme(
              textTheme: TextTheme(
                title: TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              color: Colors.white),
        ),
      ),
    );
  }
}
