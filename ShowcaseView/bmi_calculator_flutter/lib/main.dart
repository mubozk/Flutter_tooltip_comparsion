import 'package:bmi_calculator_flutter/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/screens/input_page.dart';
import 'package:showcaseview/showcaseview.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light(
          primary: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: ShowCaseWidget(
        builder: Builder(
          builder: (context) => InputPage(),
        ),
      ),
    );
  }
}
