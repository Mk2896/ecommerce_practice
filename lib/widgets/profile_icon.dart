import 'package:ecommerce_practice/global_constant.dart';
import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key, required this.radius, this.color = primaryColor})
      : super(key: key);

  final double radius;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Color(color),
          radius: radius,
        ),
        CircleAvatar(
          backgroundImage: const AssetImage("assets/images/profile.png"),
          radius: radius - 2,
        )
      ],
    );
  }
}
