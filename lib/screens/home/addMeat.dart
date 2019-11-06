import 'package:flutter/material.dart';
import 'package:meattracker/shared/buttons.dart';
import 'package:meattracker/shared/constants.dart';

class AddMeat extends StatefulWidget {
  const AddMeat({Key key}) : super(key: key);

  @override
  _AddMeatState createState() => _AddMeatState();
}

class _AddMeatState extends State<AddMeat> {
  final _formKey = GlobalKey<_AddMeatState>();
  @override

  // Form Field State
  String description = '';
  String type = '';
  int amound = 0;
  bool processed = false;
  DateTime dateTime = DateTime.now();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Add Meat'),
        // centerTitle: true,
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0.0,
      ),
      body: Form(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(left: 20, right: 20),
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Text(
                        'Add Meat Entry',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Description'),
                    validator: (val) => val.isEmpty ? 'Please Enter a Description' : null,
                    onChanged: (val) {
                      setState(() => description = val);
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Amount'),
                    validator: (val) => val.isEmpty ? 'Please Enter the Amount' : null,
                    keyboardType: TextInputType.numberWithOptions(),
                    onChanged: (val) {
                      setState(() => description = val);
                    },
                  ),
                  ListItem(
                    descriptionField: FormText(text: 'Meat Type'),
                    formField: RoundedButton(color: Theme.of(context).primaryColor),
                  ),
                  ListItem(
                    descriptionField: FormText(text: 'Meat Type'),
                    formField: RoundedButton(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RoundedButton(text: 'Save', color: Theme.of(context).accentColor),
                RoundedButton(
                  text: 'Discard',
                  color: Theme.of(context).errorColor,
                  onTab: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
              ],
            )
          ],
        ),
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
  final dynamic descriptionField;
  final dynamic formField;

  const ListItem({Key key, this.descriptionField, this.formField}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
        // child: Row(children: [SizedBox(width: 20), descriptionField, SizedBox(width: 40), formField]),
        child: Row(
          children: <Widget>[formField],
        ));
  }
}
