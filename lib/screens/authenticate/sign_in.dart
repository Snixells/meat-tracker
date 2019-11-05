import 'package:flutter/material.dart';
import 'package:meattracker/services/services.dart';
import 'package:meattracker/shared/constants.dart';
import 'package:meattracker/shared/shared.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({Key key, this.toggleView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
        elevation: 0.0,
        centerTitle: true,
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
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
                validator: (val) => val.length < 6 ? 'Please Enter your password' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              RoundedButton(
                color: Theme.of(context).primaryColor,
                text: 'Sign in',
                sideLength: 40,
                fontSize: 18,
                onTab: () async {
                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  print(result);
                  if (result == null) {
                    setState(() => error = 'Please Enter valid Information');
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
