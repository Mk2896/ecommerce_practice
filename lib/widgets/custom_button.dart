import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:flutter/material.dart';

enum ButtonType { secondary, primary }

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.topMargin,
    this.bottomMargin,
    this.topPadding,
    this.bottomPadding,
    this.leftPadding,
    this.rightPadding,
    this.width,
    required this.buttonText,
    required this.buttonMethod,
    required this.buttonType,
  })  : backgroundColor = buttonType == ButtonType.primary
            ? const Color(primaryColor)
            : const Color(secondaryColor),
        borderColor = buttonType == ButtonType.primary
            ? const Color(primaryColor)
            : const Color(primaryFontColor),
        textColor = buttonType == ButtonType.primary
            ? const Color(secondaryColor)
            : const Color(primaryFontColor),
        super(key: key);

  final double? topMargin;
  final double? bottomMargin;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final double? width;
  final void Function() buttonMethod;
  final String buttonText;
  final ButtonType buttonType;

  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: topMargin ?? 0,
        bottom: bottomMargin ?? 0,
      ),
      padding: EdgeInsets.only(
        left: leftPadding ?? 0,
        right: rightPadding ?? 0,
        top: topPadding ?? 0,
        bottom: bottomPadding ?? 0,
      ),
      width: width ?? MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton(
        onPressed: buttonMethod,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          side: BorderSide(color: borderColor),
        ),
        child: CustomText(
          text: buttonText,
          textColor: textColor,
          textType: TextType.boldText,
        ),
      ),
    );
  }
}
