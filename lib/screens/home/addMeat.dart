import 'package:flutter/material.dart';
import 'package:meattracker/shared/buttons.dart';
import 'package:meattracker/shared/constants.dart';
import 'package:flutter/cupertino.dart';

class AddMeat extends StatefulWidget {
  const AddMeat({Key key}) : super(key: key);

  @override
  _AddMeatState createState() => _AddMeatState();
}

class _AddMeatState extends State<AddMeat> {
  final _formKey = GlobalKey<_AddMeatState>();
  @override
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  // Form Field State
  String description = '';
  int amount = 0;
  bool processed = false;
  DateTime dateTime = DateTime.now();
  String type;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Add Meat'),
        // centerTitle: true,
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0.0,
      ),
      body: Form(
        key: _formKey,
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
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Amount'),
                    validator: (val) => val.isEmpty ? 'Please Enter the Amount' : null,
                    keyboardType: TextInputType.numberWithOptions(),
                    onChanged: (val) {
                      setState(() => description = val);
                    },
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 12),
                        DropdownButton<String>(
                          value: type,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          underline: Container(
                            height: 0,
                          ),
                          hint: Text('Meat Type'),
                          onChanged: (String newValue) {
                            setState(() {
                              type = newValue;
                            });
                          },
                          items: <String>['Red Meat', 'Poultry ', 'Pork', 'Seafood'].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        SizedBox(width: 80),
                        Text('Processed:', style: TextStyle(fontSize: 15)),
                        Checkbox(
                          value: processed,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (bool value) {
                            setState(() {
                              processed = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      children: [
                        SizedBox(width: 12),
                        Text(
                          'Date: ',
                          style: TextStyle(fontSize: 15),
                        ),
                        // Text('Date:', style: TextStyle(fontSize: 15)),
                        // SizedBox(width: 10),
                        FlatButton(
                          onPressed: () => _selectDate(context),
                          child: Text("${selectedDate.toLocal().day}.${selectedDate.toLocal().month}.${selectedDate.toLocal().year}"),
                        ),
                        RoundedButton(
                          onTab: () => _selectDate(context),
                          text: "${selectedDate.toLocal().day}.${selectedDate.toLocal().month}.${selectedDate.toLocal().year}",
                          color: Colors.white,
                          fontSize: 15,
                          fontColor: Colors.black,
                        ),
                        SizedBox(width: 20.0),
                      ],
                    ),
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
