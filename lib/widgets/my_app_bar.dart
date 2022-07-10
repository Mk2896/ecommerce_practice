import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/back_button.dart';
import 'package:ecommerce_practice/widgets/cart_icon.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:ecommerce_practice/widgets/profile_icon.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget myAppBar({
  String? screenTitle,
  required BuildContext context,
}) {
  return AppBar(
    centerTitle: Navigator.canPop(context),
    automaticallyImplyLeading: false,
    backgroundColor: const Color(secondaryColor),
    leading: Navigator.canPop(context) ? backButton(context) : null,
    title: screenTitle != null
        ? CustomText(
            text: screenTitle,
            textColor: const Color(primaryFontColor),
            textType: TextType.title,
          )
        : const CustomText(
            text: "E-com App",
            textColor: Color(primaryColor),
            textType: TextType.title,
          ),
    actions: [
      Builder(
        builder: (context) => InkWell(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: const ProfileIcon(radius: 15),
        ),
      ),
      CartIcon(cartCount: "99+".toString()),
    ],
  );
}
