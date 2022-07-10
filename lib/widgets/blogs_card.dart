import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/screens/blog_detail.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BlogsCard extends StatelessWidget {
  const BlogsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const BlogDetail(),
      )),
      trailing: const Image(
        fit: BoxFit.fill,
        image: AssetImage("assets/images/blogs.png"),
      ),
      isThreeLine: true,
      minVerticalPadding: 15,
      title: const CustomText(
        text: "Philosophy That Addresses Topics Such As Goodness",
        textColor: Color(primaryFontColor),
        textType: TextType.heading3,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          CustomText(
            text:
                "Agar tetap kinclong, bodi motor ten, kinclong, bodi motor ten",
            textColor: Color(primaryFontColor),
            textType: TextType.text,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          CustomText(
            text: "13 Jan 2021",
            textColor: Color(secondaryFontColor),
            textType: TextType.text,
          ),
        ],
      ),
    );
  }
}
