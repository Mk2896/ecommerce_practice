import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:ecommerce_practice/widgets/my_app_bar.dart';
import 'package:ecommerce_practice/widgets/side_drawer.dart';
import 'package:flutter/material.dart';

class BlogDetail extends StatelessWidget {
  const BlogDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        context: context,
        screenTitle: "Blog Detail",
      ),
      drawer: const SideDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(horizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Image(
                  image: AssetImage("assets/images/blogs.png"),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: verticalPadding),
                child: CustomText(
                  text:
                      "Philosophy Tips Merawat Bodi Mobil agar Tidak Terlihat Kusam",
                  textColor: Color(primaryFontColor),
                  textType: TextType.title,
                ),
              ),
              const CustomText(
                text: "13 Jan 2021",
                textColor: Color(secondaryFontColor),
                textType: TextType.text,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: verticalPadding),
                child: CustomText(
                  text:
                      "The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. ",
                  textColor: Color(primaryFontColor),
                  textType: TextType.text,
                  textAlignment: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
