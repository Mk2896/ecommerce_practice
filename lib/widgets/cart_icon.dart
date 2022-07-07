import 'package:badges/badges.dart';
import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/screens/my_cart.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key, required this.cartCount}) : super(key: key);

  final String cartCount;

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeContent: CustomText(
        text: cartCount,
        textColor: const Color(secondaryColor),
        textType: TextType.smallText,
      ),
      position: BadgePosition.topEnd(top: 2, end: 0),
      child: IconButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MyCart(),
          ),
        ),
        icon: const Icon(
          Icons.shopping_cart_outlined,
          color: Color(primaryFontColor),
        ),
      ),
    );
  }
}
