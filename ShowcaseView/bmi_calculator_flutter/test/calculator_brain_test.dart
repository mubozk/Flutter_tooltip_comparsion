import 'package:bmi_calculator_flutter/calculator_brain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('The bmi result as number of the', () {
    test('given height and weight', () {
      //ARRANGE
      CalculatorBrain calculatorBrain =
          CalculatorBrain(height: 200, weight: 100);
      //ACT
      String calculatedBMI = calculatorBrain.calculateBMI();
      //ASSERT
      expect(calculatedBMI, '25');
    });
    test('given height and weight', () {
      //ARRANGE
      CalculatorBrain calculatorBrain =
          CalculatorBrain(height: 200, weight: 50);
      //ACT
      String calculatedBMI = calculatorBrain.calculateBMI();
      //ASSERT
      expect(calculatedBMI, '13');
    });
    test('given height and weight', () {
      //ARRANGE
      CalculatorBrain calculatorBrain =
          CalculatorBrain(height: 200, weight: 80);
      //ACT
      String calculatedBMI = calculatorBrain.calculateBMI();
      //ASSERT
      expect(calculatedBMI, '20');
    });
  });
  group("BMI result of the", () {
    test("given bmi", () {
      //ARRANGE
      CalculatorBrain calculatorBrain = CalculatorBrain();
      calculatorBrain.bmi = 25;
      //ACT
      String resultAtHand = calculatorBrain.getResult();
      //ASSERT
      expect(resultAtHand, 'Overweight');
    });
    test("given bmi", () {
      //ARRANGE
      CalculatorBrain calculatorBrain = CalculatorBrain();
      calculatorBrain.bmi = 20;
      //ACT
      String resultAtHand = calculatorBrain.getResult();
      //ASSERT
      expect(resultAtHand, 'Normal');
    });
    test("given bmi", () {
      //ARRANGE
      CalculatorBrain calculatorBrain = CalculatorBrain();
      calculatorBrain.bmi = 17;
      //ACT
      String resultAtHand = calculatorBrain.getResult();
      //ASSERT
      expect(resultAtHand, 'Underweight');
    });
  });

  group('The bmi comment of the given', () {
    test("given bmi", () {
      //ARRANGE
      CalculatorBrain calculatorBrain = CalculatorBrain();
      calculatorBrain.bmi = 25;
      //ACT
      String resultAtHand = calculatorBrain.getInterpretation();
      //ASSERT
      expect(resultAtHand,
          ' You have a higher than normal body weight. Try to exercise more');
    });
    test("given bmi", () {
      //ARRANGE
      CalculatorBrain calculatorBrain = CalculatorBrain();
      calculatorBrain.bmi = 20;
      //ACT
      String resultAtHand = calculatorBrain.getInterpretation();
      //ASSERT
      expect(resultAtHand, 'You have a normal body weight Good job');
    });
    test("given bmi", () {
      //ARRANGE
      CalculatorBrain calculatorBrain = CalculatorBrain();
      calculatorBrain.bmi = 17;
      //ACT
      String resultAtHand = calculatorBrain.getInterpretation();
      //ASSERT
      expect(resultAtHand,
          'You have a lower than normal body weight. You can eat a bit more');
    });
  });
}
