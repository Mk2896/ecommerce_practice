import 'package:ecommerce_practice/global_constants/colors.dart';
import 'package:ecommerce_practice/widgets/global/cart_icon.dart';
import 'package:ecommerce_practice/widgets/global/custom_text.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget myAppBar({
  String? screenTitle,
  required BuildContext context,
}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: const Color(secondaryColor),
    title: screenTitle != null
        ? CustomText(
            text: screenTitle,
            textColor: const Color(primaryFontColor),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          )
        : const CustomText(
            text: "E-com App",
            textColor: Color(primaryColor),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
    actions: [
      CartIcon(cartCount: 15.toString()),
    ],
  );
}
