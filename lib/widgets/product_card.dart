import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/screens/product_detail.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.height,
    this.isDiscounted = false,
  }) : super(key: key);

  final double height;
  final bool isDiscounted;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.45;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(secondaryColor),
        borderRadius: BorderRadius.circular(radius),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                width: width,
                height: height * 0.5,
                margin: const EdgeInsets.all(8),
                child: const Image(
                  image: AssetImage("assets/images/Product.png"),
                ),
              ),
              if (isDiscounted)
                const Positioned(
                  left: 10,
                  child: Chip(
                    label: CustomText(
                      text: "Sale",
                      textColor: Color(secondaryColor),
                      textType: TextType.boldText,
                    ),
                    backgroundColor: Color(errorColor),
                  ),
                ),
            ],
          ),
          Container(
            width: width,
            height: height * 0.35,
            margin: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProductDetail(),
                  )),
                  child: const CustomText(
                    text: "TMA-2 HD Wireless",
                    textColor: Color(primaryFontColor),
                    textType: TextType.heading3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const CustomText(
                  text: "Rs. 1.500.000",
                  textColor: Color(errorColor),
                  textType: TextType.boldText,
                ),
                if (isDiscounted) ...[
                  CustomText(
                    text: "Rs. 1.500.000",
                    textColor: const Color(secondaryFontColor).withOpacity(0.5),
                    textType: TextType.text,
                    textDecoration: TextDecoration.lineThrough,
                  ),
                ],
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.yellow[800],
                        ),
                        const CustomText(
                          text: "4.6",
                          textColor: Color(primaryFontColor),
                          textType: TextType.text,
                        ),
                        const Expanded(
                          child: Center(
                            child: CustomText(
                              text: "86 Reviews",
                              textColor: Color(primaryFontColor),
                              textType: TextType.text,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.more_vert,
                          color: Color(secondaryFontColor),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
