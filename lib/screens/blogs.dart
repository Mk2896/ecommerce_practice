import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/blogs_card.dart';
import 'package:ecommerce_practice/widgets/my_app_bar.dart';
import 'package:ecommerce_practice/widgets/search.dart';
import 'package:ecommerce_practice/widgets/side_drawer.dart';
import 'package:flutter/material.dart';

class Blogs extends StatelessWidget {
  Blogs({Key? key}) : super(key: key);
  final GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();

  void _search() {
    if (searchFormKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, screenTitle: "Blogs"),
      drawer: const SideDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(horizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Search(
              searchFormKey: searchFormKey,
              searchController: searchController,
              searchMethod: _search,
              labelText: "Search Blog",
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                padding: const EdgeInsets.symmetric(vertical: verticalPadding),
                itemBuilder: (context, index) {
                  return const BlogsCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
