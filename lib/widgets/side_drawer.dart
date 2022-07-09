import 'package:ecommerce_practice/global_constant.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(secondaryColor),
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(primaryColor),
            ),
            child: Text("asd"),
          ),
        ],
      ),
    );
  }
}
