import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.autofocus,
    this.topMargin,
    this.bottomMargin,
    this.height,
    this.initialValue,
    this.isEnabled,
    this.isPassword,
    this.isReadonly,
    this.keyboardType,
    this.maxLength,
    this.passwordChar,
    this.textAlignment,
    this.textCapitalization,
    required this.textController,
    this.textDirection,
    this.textScrollController,
    this.validationMethod,
    this.width,
    this.prefix,
    this.suffix,
    this.errorText,
    this.labelPosition,
    this.labelStyle,
    this.helperText,
    this.hintText,
    this.labelText,
    this.bottomPadding,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
  }) : super(key: key);

  final double? topMargin;
  final double? bottomMargin;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final double? width;
  final double? height;
  final bool? autofocus;
  final TextEditingController textController;
  final ScrollController? textScrollController;
  final bool? isReadonly;
  final bool? isEnabled;
  final String? initialValue;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? isPassword;
  final String? passwordChar;
  final TextAlign? textAlignment;
  final TextCapitalization? textCapitalization;
  final TextDirection? textDirection;
  final String? Function(String?)? validationMethod;
  final Widget? prefix;
  final Widget? suffix;
  final String? errorText;
  final FloatingLabelBehavior? labelStyle;
  final FloatingLabelAlignment? labelPosition;
  final String? helperText;
  final String? labelText;
  final String? hintText;
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
      height: height,
      child: TextFormField(
        autofocus: autofocus ?? false,
        controller: textController,
        cursorColor: Colors.black,
        cursorRadius: const Radius.circular(5),
        enabled: isEnabled,
        readOnly: isReadonly ?? false,
        initialValue: initialValue,
        keyboardType: keyboardType,
        maxLength: maxLength,
        obscureText: isPassword ?? false,
        obscuringCharacter: passwordChar ?? "*",
        scrollController: textScrollController,
        textAlign: textAlignment ?? TextAlign.start,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        textDirection: textDirection,
        validator: validationMethod,
        decoration: InputDecoration(
          border: textFieldBorder(),
          enabledBorder: textFieldBorder(),
          disabledBorder: textFieldBorder(),
          errorBorder: textFieldBorder(
              noBorder: false, borderColor: const Color(errorColor)),
          focusedBorder: textFieldBorder(
              noBorder: false, borderColor: const Color(secondaryFontColor)),
          prefixIcon: prefix,
          suffixIcon: suffix,
          errorText: errorText,
          filled: true,
          fillColor: const Color(backgroundColor),
          floatingLabelBehavior: labelStyle,
          floatingLabelAlignment: labelPosition,
          helperText: helperText,
          hintText: hintText,
          hintStyle: textStyle(
              textColor: const Color(secondaryFontColor),
              textType: TextType.boldText),
          labelText: labelText,
          labelStyle: textStyle(
              textColor: const Color(secondaryFontColor),
              textType: TextType.text),
        ),
      ),
    );
  }
}

OutlineInputBorder textFieldBorder({
  bool noBorder = true,
  Color? borderColor,
  double borderWidth = 1.0,
}) {
  assert(noBorder || borderColor != null,
      "borderColor is required when noBorder is false");

  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: noBorder
        ? const BorderSide(style: BorderStyle.none)
        : BorderSide(color: borderColor!, width: borderWidth),
  );
}
