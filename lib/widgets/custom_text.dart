import 'package:flutter/material.dart';

enum TextType {
  heading1,
  heading2,
  heading3,
  title,
  boldText,
  text,
  smallText,
}

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    required this.textColor,
    required this.textType,
    this.overflow,
    this.letterSpacing,
    this.isItalic = false,
    this.textDecoration,
    this.textAlignment,
  }) : super(key: key);

  final String text;
  final TextOverflow? overflow;
  final Color textColor;
  final double? letterSpacing;
  final TextType textType;
  final bool isItalic;
  final TextDecoration? textDecoration;
  final TextAlign? textAlignment;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlignment,
        style: textStyle(
          textColor: textColor,
          textType: textType,
          isItalic: isItalic,
          letterSpacing: letterSpacing,
          overflow: overflow,
          textDecoration: textDecoration,
        ));
  }
}

TextStyle textStyle({
  required Color textColor,
  bool isItalic = false,
  required TextType textType,
  double? letterSpacing,
  TextOverflow? overflow,
  TextDecoration? textDecoration,
}) {
  FontStyle fontStyle = isItalic ? FontStyle.italic : FontStyle.normal;
  double fontSize = textType == TextType.heading1
      ? 25
      : (textType == TextType.heading2
          ? 16
          : (textType == TextType.heading3
              ? 15
              : (textType == TextType.title
                  ? 20
                  : (textType == TextType.boldText
                      ? 14
                      : (textType == TextType.text
                          ? 13
                          : textType == TextType.smallText
                              ? 9
                              : 12)))));
  FontWeight fontWeight = textType == TextType.heading1
      ? FontWeight.w700
      : (textType == TextType.heading2
          ? FontWeight.w700
          : (textType == TextType.heading3
              ? FontWeight.w500
              : (textType == TextType.title
                  ? FontWeight.w700
                  : (textType == TextType.boldText
                      ? FontWeight.w500
                      : (textType == TextType.text
                          ? FontWeight.w400
                          : textType == TextType.smallText
                              ? FontWeight.w400
                              : FontWeight.w400)))));
  return TextStyle(
    color: textColor,
    fontFamily: "DM SANS",
    fontSize: fontSize,
    fontWeight: fontWeight,
    overflow: overflow ?? TextOverflow.clip,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: textDecoration,
  );
}
