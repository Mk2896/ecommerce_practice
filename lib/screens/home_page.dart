import 'package:ecommerce_practice/global_constants/colors.dart';
import 'package:ecommerce_practice/widgets/global/custom_text_field.dart';
import 'package:ecommerce_practice/widgets/global/my_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(secondaryColor),
      appBar: myAppBar(
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              leftPadding: 20,
              rightPadding: 20,
              textAlignment: TextAlign.center,
              textController: _searchController,
            )
          ],
        ),
      ),
    );
  }
}
