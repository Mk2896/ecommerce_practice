import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/screens/product_detail.dart';
import 'package:ecommerce_practice/screens/products.dart';

import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    Key? key,
    required this.index,
    required this.topPadding,
  }) : super(key: key);

  final int index;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Products(
          screenTitle: "Category Product",
          search: () {},
        ),
      )),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.22,
        height: 20,
        padding: EdgeInsets.all(topPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: Color(index % 2 == 0 ? 0XFFE4F3EA : 0XFFFFECE8),
                ),
                child: Image(
                    image: AssetImage(index % 2 == 0
                        ? 'assets/images/Vegetable.png'
                        : 'assets/images/Fruits.png')),
              ),
            ),
            const CustomText(
                text: "Foods",
                textColor: Color(primaryFontColor),
                textType: TextType.boldText)
          ],
        ),
      ),
    );
  }
}
