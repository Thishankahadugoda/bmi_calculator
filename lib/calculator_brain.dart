import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi;

  String calculatorBMI() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

//  String getResult() {
//    if (_bmi >= 25) {
//      return 'overWeight';
//    } else if (_bmi > 18.5) {
//      return 'normal';
//    } else {
//      return 'underwight';
//    }
//  }
//
//  String getInterpretation() {
//    if (_bmi >= 25) {
//      return 'Your Bmi score is high you have to exrtcise more';
//    } else if (_bmi > 18.5) {
//      return 'good job, yoyr BMI score is normal';
//    } else {
//      return 'Your BMI score is low you have to eat more';
//    }
//  }
}
