import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton(
      {Key? key,
      required this.text,
      this.bottomMargin,
      this.topMargin,
      this.rightMargin,
      this.leftMargin,
      this.height,
      this.width})
      : super(key: key);
  final double? leftMargin;
  final double? rightMargin;
  final double? topMargin;
  final double? bottomMargin;
  final double? width;
  final double? height;
  final String text;

  Future<void> signInWithGoogle(context) async {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: leftMargin ?? 0,
        right: rightMargin ?? 0,
        top: topMargin ?? 0,
        bottom: bottomMargin ?? 0,
      ),
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color(secondaryColor)),
        ),
        onPressed: () => signInWithGoogle(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 30,
              child: Image(image: AssetImage("assets/images/google_logo.png")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: horizontalPadding),
              child: CustomText(
                text: text,
                textColor: const Color(secondaryFontColor),
                textType: TextType.heading3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
