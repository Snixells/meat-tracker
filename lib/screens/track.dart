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
        body: ListView(
          children: [
            Center(
              child: new RoundedButton(text: 'Add Meat'),
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

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key key,
      this.sideLength = 50,
      this.margin = 20,
      this.borderRadius = 25,
      this.fontSize = 20,
      this.text = 'Text'})
      : super(key: key);

  final double sideLength;
  final double margin;
  final double borderRadius;
  final double fontSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: sideLength,
      width: sideLength * 3,
      duration: Duration(seconds: 2),
      curve: Curves.easeIn,
      margin: EdgeInsets.all(margin),
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          splashColor: Theme.of(context).accentColor,
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
