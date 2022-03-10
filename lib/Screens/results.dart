import 'package:flutter/material.dart';
import '../constants.dart';
import '../Components/calci_card.dart';
import '../constants.dart';
import '../Components/bottom_button.dart';
import 'package:bmi_calculator/calculate_bmi.dart';

CalculatorBrain cb  =  CalculatorBrain();

class Results extends StatelessWidget {

  final int weight;
  final double height;

  Results({required this.weight, required this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate BMI'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              "Results",
              style: kBoldValueText,
            ),
            Expanded(
                child: CalciCard(
                    onPress: () {},
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(cb.getResult(), style: kResultH1),
                        Text(
                            cb.CalculateBMI(weight,height),

                          style: kResultH2,
                        ),
                        Text(
                          cb.getStatement(),
                          style: TextStyle(fontSize: 29, letterSpacing: 1),
                        )
                      ],
                    ))),
            BottomButton(
                title: "Re-Calculate BMI",
                onPress: () {
                  Navigator.pop(context);
                })
          ]),
    );
  }
}
