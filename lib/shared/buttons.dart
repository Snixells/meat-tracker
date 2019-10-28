import 'package:flutter/material.dart';

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
