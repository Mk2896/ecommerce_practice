import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class TitleAndSeeAll extends StatelessWidget {
  const TitleAndSeeAll({
    Key? key,
    required this.seeAllFunction,
    required this.sectionTitle,
    this.hideSeeAll = false,
  }) : super(key: key);

  final void Function() seeAllFunction;
  final String sectionTitle;
  final bool hideSeeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: sectionTitle,
            textColor: const Color(primaryFontColor),
            textType: TextType.heading3,
          ),
          if (!hideSeeAll)
            InkWell(
              onTap: seeAllFunction,
              child: const CustomText(
                text: "See All",
                textColor: Color(primaryColor),
                textType: TextType.boldText,
              ),
            ),
        ],
      ),
    );
  }
}
