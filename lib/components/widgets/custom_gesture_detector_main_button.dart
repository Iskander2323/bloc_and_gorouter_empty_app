import 'package:flutter/material.dart';

class CustomGestureDetectorMainButton extends StatelessWidget {
  const CustomGestureDetectorMainButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
  });
  final String title;
  final Function() onTap;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 60,
        child: Text(
          title,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? 20,
          ),
        ),
      ),
    );
  }
}
