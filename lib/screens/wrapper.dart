import 'package:flutter/material.dart';
import 'package:meattracker/screens/authenticate/authenticate.dart';
import 'package:meattracker/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);

    // Return either home or authenticate Widget

    if (user == null) {
      print('No user');
      return Authenticate();
    } else {
      print('User $user');
      return Home();
    }
  }
}
