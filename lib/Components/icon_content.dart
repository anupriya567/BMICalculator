import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String str;
  IconContent({required this.icon,required this.str});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  <Widget>[
        Icon(icon,
        size: 80.00,
        color: Colors.white,),
        SizedBox(
          height: 20.00,
        ),
        Text(
            str,
            style: kLabelTextStyle),
      ],
    );
  }
}