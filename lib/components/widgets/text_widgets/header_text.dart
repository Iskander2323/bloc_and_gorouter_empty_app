import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final Color color;
  final FontWeight fontWeight;

  const HeaderText(
    this.text, {
    super.key,
    this.fontSize = 22,
    this.textAlign = TextAlign.start,
    this.color = Colors.black,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        height: 1.2,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
