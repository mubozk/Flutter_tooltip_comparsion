import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants.dart';

class ReusableCard extends StatelessWidget {


  ReusableCard({required this.colour, required this.cardChild, this.onPress});

  final Widget cardChild;
  final Color colour;
  final VoidCallback? onPress; // instead of a func

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
