import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const DescriptionText(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
    this.fontSize = 14,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        height: 1.4,
        fontWeight: fontWeight,
      ),
    );
  }
}
