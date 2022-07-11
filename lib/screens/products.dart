import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/my_app_bar.dart';
import 'package:ecommerce_practice/widgets/product_card.dart';
import 'package:ecommerce_practice/widgets/search.dart';
import 'package:ecommerce_practice/widgets/side_drawer.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  Products({Key? key, required this.screenTitle, required this.search})
      : super(key: key);

  final GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();

  final String? screenTitle;
  final void Function() search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        context: context,
        screenTitle: screenTitle,
      ),
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
              labelText: "Search Product Name",
              searchMethod: search,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: productCardHeight,
                  mainAxisSpacing: verticalPadding,
                ),
                padding: const EdgeInsets.symmetric(vertical: verticalPadding),
                itemBuilder: (context, index) {
                  return const ProductCard(height: productCardHeight);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
