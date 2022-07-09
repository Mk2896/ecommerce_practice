import 'package:ecommerce_practice/global_constant.dart';
import 'package:flutter/material.dart';

Widget backButton(BuildContext context) {
  return IconButton(
    onPressed: () => Navigator.of(context).pop(),
    icon: const Icon(
      Icons.arrow_back_ios_new_rounded,
      color: Color(primaryFontColor),
    ),
  );
}
