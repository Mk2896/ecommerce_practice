import 'package:ecommerce_practice/screens/home_page.dart';
import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomePage(),
    ));
    return Center();
  }
}
