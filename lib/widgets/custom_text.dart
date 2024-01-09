import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final int maxLines;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.textColor = Colors.black,
    this.textAlign = TextAlign.left,
    this.textDecoration = TextDecoration.none,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
        decoration: textDecoration,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
