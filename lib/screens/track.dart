import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meattracker/shared/buttons.dart';

class TrackMeat extends StatelessWidget {
  const TrackMeat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meat Tracker'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.user, color: Colors.black),
              onPressed: () => Navigator.pushNamed(context, '/profile'),
            ),
          ],
        ),
        body: ListView(
          children: [
            Center(
              child: new RoundedButton(text: 'Add Meat', color: Theme.of(context).accentColor,),
            ),
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
            MeatData(
              amount: 300,
              datetime: "27.10.2019",
              type: 'Pork',
              processed: true,
            ),
            MeatData(
              amount: 300,
              datetime: "27.10.2019",
              type: 'Pork',
              processed: true,
            ),
            MeatData(
              amount: 300,
              datetime: "27.10.2019",
              type: 'Pork',
              processed: true,
            ),
            MeatData(
              amount: 300,
              datetime: "27.10.2019",
              type: 'Pork',
              processed: true,
            ),
            MeatData(
              amount: 300,
              datetime: "27.10.2019",
              type: 'Pork',
              processed: true,
            ),
            MeatData(
              amount: 300,
              datetime: "27.10.2019",
              type: 'Pork',
              processed: true,
            ),
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
      {Key key, this.type, this.amount, this.datetime = "Text", this.processed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.only(left: 60, right: 60, bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(type),
                  Text('${amount.toString()}g'),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$datetime'),
                  Text('$processed'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
