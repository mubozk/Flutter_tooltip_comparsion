import 'package:flutter/material.dart';

class AdjustableIconButton extends StatelessWidget {
  AdjustableIconButton({required this.icon, required this.onPress});

  final Icon icon;
  final VoidCallback onPress; // instead of a func

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      fillColor: Color(0xFF4C4F5E),
      elevation: 11,
      child: icon,
      onPressed: onPress,
    );
  }
}
