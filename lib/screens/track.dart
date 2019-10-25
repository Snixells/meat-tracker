import 'package:flutter/material.dart';

import '../shared/shared.dart';

class TrackMeat extends StatelessWidget {
  const TrackMeat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height: 100, width: 100, color: Colors.orange),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
