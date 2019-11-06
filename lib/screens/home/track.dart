import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          backgroundColor: Theme.of(context).primaryColor,
          // child: Text('Add', style: TextStyle(color: Colors.white)),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 15),
          children: [
            MeatData(
              name: 'Breakfast',
              amount: 200,
              datetime: "25.10.2019",
              type: 'Chicken',
              processed: false,
            ),
            MeatData(
              name: 'Döner',
              amount: 300,
              datetime: "27.10.2019",
              type: 'Chicken',
              processed: true,
            ),
            MeatData(
              name: 'Döner',
              amount: 300,
              datetime: "27.10.2019",
              type: 'Chicken',
              processed: true,
            ),
            MeatData(
              name: 'Döner',
              amount: 300,
              datetime: "27.10.2019",
              type: 'Chicken',
              processed: true,
            ),
            MeatData(
              name: 'Big Fat Meat',
              amount: 300,
              datetime: "27.11.2019",
              type: 'Beef',
              processed: false,
            ),
            MeatData(
              name: 'Tasty Breakfast',
              amount: 300,
              datetime: "12.09.2017",
              type: 'Pork',
              processed: true,
            ),
            MeatData(
              name: 'Caesars Salad',
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
  final String name;

  const MeatData({Key key, this.type, this.amount, this.datetime = "Text", this.processed, this.name = 'PLACEHOLDER'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$name',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: 90,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$type'),
                    Text('$datetime'),
                  ],
                ),
              ),
            ),
            SizedBox(width: 30),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Container(
                width: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$amount g'),
                    if (processed) Text('processed'),
                  ],
                ),
              ),
            ),
          ],
        ),

        // ListTile(
        //   leading: Text('Name', style: TextStyle(),),
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(type),
        //       Text('${amount.toString()}g'),
        //     ],
        //   ),
        //   subtitle: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text('$datetime'),
        //       if (processed) Text('processed'),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
