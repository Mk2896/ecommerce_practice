import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, required this.loadingText}) : super(key: key);

  final String loadingText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: const Color(primaryColor),
            borderRadius: BorderRadius.circular(10.0)),
        width: 300.0,
        height: 200.0,
        alignment: AlignmentDirectional.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: CircularProgressIndicator(
                  color: Color(secondaryColor),
                  value: null,
                  strokeWidth: 5.0,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25.0),
              child: Center(
                child: CustomText(
                  text: loadingText,
                  textColor: const Color(secondaryColor),
                  textType: TextType.boldText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
