import 'package:ecommerce_practice/widgets/my_app_bar.dart';
import 'package:ecommerce_practice/widgets/side_drawer.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        context: context,
        screenTitle: "TMA-2 HD Wireless",
      ),
      drawer: const SideDrawer(),
      body: const Center(),
    );
  }
}
