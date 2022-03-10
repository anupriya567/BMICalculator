import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/calci_card.dart';
import '../Components/icon_content.dart';
import '../constants.dart';
import 'results.dart';
import '../Components/bottom_button.dart';
import 'package:bmi_calculator/calculate_bmi.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.female;
  double _currentSliderValue = 120;
  int currWeight = 0;
  int currAge = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kActiveCardColour,
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(children: [
          Expanded(
              child: Row(children: [
            Expanded(
              child: CalciCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: (selectedGender == Gender.male)
                      ? (kActiveCardColour)
                      : (kInactiveCardColour),
                  cardChild:
                      IconContent(icon: FontAwesomeIcons.mars, str: 'MALE')),
            ),
            Expanded(
              child: CalciCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: (selectedGender == Gender.female)
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild:
                      IconContent(icon: FontAwesomeIcons.venus, str: 'FEMALE')),
            ),
          ])),
          Expanded(
            child: CalciCard(
                onPress: () {},
                colour: kActiveCardColour,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT', style: kLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(_currentSliderValue.round().toString(),
                              style: kBoldValueText),
                          Text(
                            "cm",
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30)),
                        child: Slider(
                          value: _currentSliderValue,
                          min: 100,
                          max: 280,
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
                      )
                    ])),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: CalciCard(
                  onPress: () {},
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("WEIGHT", style: kLabelTextStyle),
                      Text(currWeight.toString(), style: kBoldValueText),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (currWeight > 1) {
                                  currWeight--;
                                }
                              });
                            },
                            backgroundColor: Color(0xFF212747),
                            child: const Icon(Icons.remove),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                currWeight++;
                              });
                            },
                            backgroundColor: Color(0xFF212747),
                            child: const Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CalciCard(
                    onPress: () {},
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("AGE", style: kLabelTextStyle),
                        Text(currAge.toString(), style: kBoldValueText),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (currAge > 1) {
                                    currAge--;
                                  }
                                });
                              },
                              backgroundColor: Color(0xFF212747),
                              child: const Icon(Icons.remove),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  currAge++;
                                });
                              },
                              backgroundColor: Color(0xFF212747),
                              child: const Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ],
          )),
          BottomButton(
              title: "Calculate BMI",
              onPress: () {
                // CalculateBMI cb = CalculateBMI();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Results(
                            weight: currWeight, height: _currentSliderValue)));
              })
        ]));
  }
}
