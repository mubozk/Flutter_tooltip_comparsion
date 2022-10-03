import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitle, required this.onTap});

  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: kBottomContainerColour,
          height: kBottomContainerHeight,
          width: double.maxFinite,
          padding: EdgeInsets.only(bottom: 20),
          margin: EdgeInsets.only(top: 10.0),
          child: Center(
              child: Text(
                buttonTitle,
                style: kLargeButtonTextStyle,
              ))),
    );
  }
}
