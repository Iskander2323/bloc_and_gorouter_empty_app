import 'package:flutter/material.dart';

class CustomInkWellMainButton extends StatelessWidget {
  const CustomInkWellMainButton({
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
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor ?? Colors.green,
        ),
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
