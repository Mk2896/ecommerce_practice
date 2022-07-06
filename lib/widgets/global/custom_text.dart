import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      required this.textColor,
      this.fontSize,
      this.fontWeight,
      this.overflow,
      this.letterSpacing})
      : super(key: key);

  final String text;
  final TextOverflow? overflow;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontFamily: "DM SANS",
        fontSize: fontSize,
        fontWeight: fontWeight,
        overflow: overflow ?? TextOverflow.clip,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
