import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/screens/login.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:ecommerce_practice/widgets/profile_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: const Color(secondaryColor),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(primaryColor),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ProfileIcon(radius: 30, color: secondaryColor),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CustomText(
                          text: "Welcome",
                          textColor: Color(secondaryColor),
                          textType: TextType.heading1,
                          overflow: TextOverflow.clip,
                        ),
                        CustomText(
                          text: "Muhammad Maaz Khan",
                          textColor: Color(secondaryColor),
                          textType: TextType.heading2,
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const CustomText(
              text: "Login",
              textColor: Color(primaryFontColor),
              textType: TextType.heading3,
            ),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Login())),
          ),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: CustomText(
              text: "Profile",
              textColor: Color(primaryFontColor),
              textType: TextType.heading3,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: CustomText(
              text: "Wishist",
              textColor: Color(primaryFontColor),
              textType: TextType.heading3,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.shopping_bag),
            title: CustomText(
              text: "Orders",
              textColor: Color(primaryFontColor),
              textType: TextType.heading3,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.newspaper),
            title: CustomText(
              text: "Blogs",
              textColor: Color(primaryFontColor),
              textType: TextType.heading3,
            ),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Login(),
              ));
            },
            leading: const Icon(Icons.logout),
            title: const CustomText(
              text: "Logout",
              textColor: Color(primaryFontColor),
              textType: TextType.heading3,
            ),
          ),
        ],
      ),
    );
  }
}
