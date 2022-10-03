import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height = 10, this.weight = 10});
  int height;
  int weight;
  double bmi = 0;

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    print(bmi);
    return bmi.toStringAsFixed(0);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return ' You have a higher than normal body weight. Try to exercise more';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight Good job';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
