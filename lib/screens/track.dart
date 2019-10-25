import 'package:flutter/material.dart';

import '../shared/shared.dart';

class TrackMeat extends StatelessWidget {
  const TrackMeat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Meat Tracker',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).accentColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MeatData(
              amount: 200,
              datetime: "25.10.2019",
              type: 'Chicken',
              processed: false,
            ),
            MeatData(
              amount: 300,
              datetime: "27.10.2019",
              type: 'Pork',
              processed: true,
            ),
            Text(
              'Hello',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}

class MeatData extends StatelessWidget {
  final String type;
  final int amount;
  final String datetime;
  final bool processed;

  const MeatData(
      {Key key, this.type, this.amount, this.datetime, this.processed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Theme.of(context).primaryColor,
      child: Text('MeatType'),
    );
  }
}
