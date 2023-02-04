
import 'package:flutter/material.dart';


class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
   const CustomTextWidget({
    super.key,
    this.text = '',
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
    this.color=Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
