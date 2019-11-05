import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meattracker/services/services.dart';
import 'package:meattracker/shared/constants.dart';
import 'package:meattracker/shared/shared.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({Key key, this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // Text Field State
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Create Account',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              RoundedButton(
                color: Theme.of(context).primaryColor,
                text: 'Continue with Google',
                width: 350,
                height: 50,
                icon: FontAwesomeIcons.google,
                onTab: () async {
                  dynamic result = await _auth.googleSignIn();
                  print(result);
                },
              ),
              SizedBox(height: 10.0),
              Text(
                'Or sign up with your Email',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter your Email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'Password needs 6+ characters' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              RoundedButton(
                color: Theme.of(context).accentColor,
                text: 'Register',
                fontSize: 20,
                width: 140,
                height: 50,
                onTab: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    print(result);
                    if (result == null) {
                      setState(() => error = 'Please Enter valid Information');
                    }
                  }
                },
              ),
              SizedBox(height: 15.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
