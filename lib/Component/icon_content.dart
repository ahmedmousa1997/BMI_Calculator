import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';


class IconContent extends StatelessWidget {

  IconContent({this.icon, this.text1});

  final IconData icon;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
            text1,
            style:KLabelTextStyle
        ),
      ],
    );
  }
}

