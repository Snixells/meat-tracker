import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key key,
      this.sideLength = 50,
      this.margin = 20,
      this.borderRadius = 25,
      this.fontSize = 20,
      this.text = 'Text',
      this.onTab,
      this.color})
      : super(key: key);

  final double sideLength;
  final double margin;
  final double borderRadius;
  final double fontSize;
  final String text;
  final Function onTab;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: sideLength,
      width: sideLength * 3,
      duration: Duration(seconds: 2),
      curve: Curves.easeIn,
      margin: EdgeInsets.all(margin),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: onTab,
          borderRadius: BorderRadius.circular(borderRadius),
          splashColor: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
