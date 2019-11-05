import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key key, this.width = 120, this.height = 40, this.margin = 20, this.borderRadius = 25, this.fontSize = 20, this.text = 'Text', this.onTab, this.color, this.icon, this.fontColor = Colors.white})
      : super(key: key);

  final double margin;
  final double borderRadius;
  final double fontSize;
  final Color fontColor;
  final String text;
  final Function onTab;
  final Color color;
  final double width;
  final double height;
  final dynamic icon;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      width: width,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      margin: EdgeInsets.all(margin),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: onTab,
          borderRadius: BorderRadius.circular(borderRadius),
          // splashColor: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (icon != null) Icon(FontAwesomeIcons.google, color: Colors.white),
              if (icon != null) SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(fontSize: fontSize, color: fontColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
