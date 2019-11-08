import 'package:flutter/material.dart';
import 'package:meattracker/services/database.dart';
import 'package:meattracker/shared/buttons.dart';
import 'package:meattracker/shared/constants.dart';
import 'package:flutter/cupertino.dart';

class AddMeat extends StatefulWidget {
  const AddMeat({Key key}) : super(key: key);

  @override
  _AddMeatState createState() => _AddMeatState();
}

class _AddMeatState extends State<AddMeat> {
  DatabaseService _db = DatabaseService();
  final _formKey = GlobalKey<FormState>();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: datetime, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != datetime)
      setState(() {
        datetime = picked;
      });
  }

  String selected;

  // Form Field State
  String description = '';
  int amount = 0;
  bool processed = false;
  DateTime datetime = DateTime.now();
  String type;

  List<String> types = ['Red Meat', 'Poultry ', 'Pork', 'Seafood'];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      setState(() => amount = int.parse(val));
                    },
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 12),
                        Container(
                          height: 65,
                          width: 120,
                          child: Center(
                            child: DropdownButtonFormField<String>(
                              // TODO Make Prettier => Change Height & Stuff
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              value: type,
                              validator: (val) => (val == null) ? 'Enter Meat Type' : null,
                              hint: Text('Meat Type'),
                              onChanged: (String newValue) {
                                setState(() {
                                  type = newValue;
                                });
                              },
                              onSaved: (val) => setState(() => description = val),
                              items: <String>['Red Meat', 'Poultry ', 'Pork', 'Seafood'].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
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
                        SizedBox(width: 12),
                        FlatButton(
                          onPressed: () => _selectDate(context), // TODO: Change to Cupertino Style On Screen Datepicker.
                          child: Text("${datetime.toLocal().day}.${datetime.toLocal().month}.${datetime.toLocal().year}"),
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
                RoundedButton(
                  text: 'Save',
                  color: Theme.of(context).accentColor,
                  onTab: () {
                    if (_formKey.currentState.validate()) {
                      print('Form validated');
                      try {
                        _db.addTrackedMeat(description, type, amount, processed, datetime);
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                ),
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
