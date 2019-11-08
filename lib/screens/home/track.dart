import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meattracker/models/models.dart';
import 'package:meattracker/services/database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TrackMeat extends StatelessWidget {
  const TrackMeat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);

    return StreamProvider<List<MeatEntry>>.value(
      value: DatabaseService(uid: user.uid).meatEntries,
      child: Scaffold(
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
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Container(
          child: MeatEntriesList(),
        ),
      ),
    );
  }
}

class MeatEntriesList extends StatefulWidget {
  MeatEntriesList({Key key}) : super(key: key);

  @override
  _MeatEntriesListState createState() => _MeatEntriesListState();
}

class _MeatEntriesListState extends State<MeatEntriesList> {
  @override
  Widget build(BuildContext context) {
    final meatEntries = Provider.of<List<MeatEntry>>(context) ?? [];

    return ListView.builder(
      itemCount: meatEntries.length,
      itemBuilder: (context, index) {
        return MeatEntryTile(meatEntry: meatEntries[index]);
      },
    );
  }
}

class MeatEntryTile extends StatelessWidget {
  final MeatEntry meatEntry;
  const MeatEntryTile({Key key, this.meatEntry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    {
      return Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    meatEntry.description,
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
                      Text(meatEntry.type),
                      Text("${meatEntry.datetime.toLocal().day}.${meatEntry.datetime.toLocal().month}.${meatEntry.datetime.toLocal().year}"),
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
                      Text('${meatEntry.amount} g'),
                      if (meatEntry.processed) Text('processed'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
