import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain
{
   // int weight = 20;
   // int height = 20;
   double _bmi = 2.0;

  String CalculateBMI(int weight, double height)
  {
    double bmi = weight/ pow(height/100,2);
    return bmi.toStringAsFixed(1);
  }

  String getResult()
  {
    if(_bmi >= 25)
      return "OverWeight";

    else if(_bmi >= 18)
      return "Normal";

    else
      return "UnderWeight";
  }

  String getStatement()
  {
    if(_bmi >= 25)
      return "You should do regular exercise and avoid eating junk food.";

    else if(_bmi >= 18)
      return "Congratulations!! You are healthy. Keep going.";

    else
      return "Take a proper Balanced diet.";
  }
  //
  //
  //
  //
  //
  //
  //
  // void incWeight()
  // {
  //   this._weight++;
  // }
  // void decWeight()
  // {
  //   this._weight--;
  // }
  // int getWeight() {
  //   return _weight;
  // }
  // int getHeight()
  // {
  //   return _height;
  // }
  // void incHeight()
  // {
  //   _height++;
  // }
  // void decHeight()
  // {
  //   _height--;
  // }
}