import 'package:ecommerce_practice/global_constants/colors.dart';
import 'package:ecommerce_practice/screens/my_cart.dart';
import 'package:ecommerce_practice/widgets/global/custom_text.dart';
import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key, required this.cartCount}) : super(key: key);

  final String cartCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.none,
      children: [
        IconButton(
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
        Positioned(
          top: 7,
          right: 5,
          child: CircleAvatar(
            backgroundColor: const Color(errorColor),
            radius: 10,
            child: CustomText(
              text: cartCount,
              textColor: const Color(secondaryColor),
              fontSize: 8,
            ),
          ),
        )
      ],
    );
  }
}
