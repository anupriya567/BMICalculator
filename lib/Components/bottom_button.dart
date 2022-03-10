import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/calci_card.dart';
import '../Components/icon_content.dart';
import '../constants.dart';
import '../Screens/results.dart';


class BottomButton extends StatelessWidget {

  final String title;
  VoidCallback onPress;

  BottomButton({required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 60.00,
        color: kBottomColour,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2

            ),
          ),
        ),
      ),
    );
  }
}
