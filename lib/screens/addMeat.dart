import 'package:flutter/material.dart';
import 'package:meattracker/shared/buttons.dart';

class AddMeat extends StatelessWidget {
  const AddMeat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Meat'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                ListItem(),
                ListItem(),
                ListItem(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RoundedButton(text: 'Save', color: Theme.of(context).accentColor),
              RoundedButton(
                  text: 'Discard', color: Theme.of(context).primaryColor),
            ],
          )
        ],
      ),
    );
  }
}

class FormText extends StatelessWidget {
  final String text;

  const FormText({Key key, this.text = 'Text'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20.0),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FormText(text: 'Meat Type'),
          RoundedButton(color: Theme.of(context).accentColor),
        ],
      ),
    );
  }
}
