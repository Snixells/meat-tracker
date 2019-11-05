import 'package:flutter/material.dart';
import 'package:meattracker/models/models.dart';
import 'package:meattracker/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meattracker/services/auth.dart';
import 'package:meattracker/shared/shared.dart';
import './screens/screens.dart';

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
          // '/': (context) => AddMeat(),
          // '/': (context) => Profile(),
          // '/': (context) => LoginScreen(),
          '/main': (context) => BottomNavbar(),
          '/analytics': (context) => Analytics(),
          '/types': (context) => MeatTypes(),
          '/login': (context) => LoginScreen(),
          '/profile': (context) => Profile(),
        },
        theme: ThemeData(
          backgroundColor: Colors.blue,
          canvasColor: Color.fromRGBO(244, 249, 242, 1),
          fontFamily: 'Nunito',
          accentColor: Color.fromRGBO(230, 57, 70, 1),
          primaryColor: Color.fromRGBO(69, 123, 157, 1),
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
