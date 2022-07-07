import 'package:ecommerce_practice/global_constant.dart';
import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: const [
        CircleAvatar(
          backgroundColor: Color(primaryColor),
          radius: 15,
        ),
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.png"),
          radius: 13,
        )
      ],
    );
  }
}
