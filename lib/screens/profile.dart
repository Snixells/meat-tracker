import 'package:flutter/material.dart';
import 'package:meattracker/services/services.dart';
import 'package:meattracker/shared/buttons.dart';

class Profile extends StatelessWidget {
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RoundedButton(
            text: 'Logout',
            color: Theme.of(context).accentColor,
            onTab: () async {
              await auth.signOut();
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
    );
  }
}
