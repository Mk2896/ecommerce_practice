import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/screens/blogs.dart';
import 'package:ecommerce_practice/screens/categories.dart';
import 'package:ecommerce_practice/screens/products.dart';
import 'package:ecommerce_practice/widgets/category_icon.dart';
import 'package:ecommerce_practice/widgets/custom_button.dart';
import 'package:ecommerce_practice/widgets/my_app_bar.dart';
import 'package:ecommerce_practice/widgets/blogs_card.dart';
import 'package:ecommerce_practice/widgets/product_card.dart';
import 'package:ecommerce_practice/widgets/search.dart';
import 'package:ecommerce_practice/widgets/side_drawer.dart';
import 'package:ecommerce_practice/widgets/title_see_all.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();

  void _search() {
    if (searchFormKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundColor),
      appBar: myAppBar(
        context: context,
      ),
      drawer: const SideDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(horizontalPadding),
              width: MediaQuery.of(context).size.width,
              color: const Color(secondaryColor),
              child: Column(
                children: [
                  Search(
                    searchFormKey: searchFormKey,
                    searchController: searchController,
                    labelText: "Search Product Name",
                    searchMethod: _search,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                    ),
                    items: [
                      Image.asset("assets/images/top_banner1.png"),
                      Image.asset("assets/images/top_banner2.png"),
                    ],
                  ),
                  TitleAndSeeAll(
                      seeAllFunction: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Categories(
                                screenTitle: "All Categories", search: () {}),
                          )),
                      sectionTitle: "Categories"),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return CategoryIcon(
                          index: index,
                          topPadding: 25 - horizontalPadding,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(horizontalPadding),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleAndSeeAll(
                    seeAllFunction: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Products(
                          screenTitle: "Featured Products", search: () {}),
                    )),
                    sectionTitle: "Featured Products",
                  ),
                  SizedBox(
                    height: productCardHeight,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return const ProductCard(
                          height: productCardHeight,
                        );
                      },
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: false,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                    ),
                    items: [
                      Image.asset("assets/images/top_banner1.png"),
                    ],
                  ),
                  TitleAndSeeAll(
                    seeAllFunction: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Products(screenTitle: "Best Sellers", search: () {}),
                    )),
                    sectionTitle: "Best Sellers",
                  ),
                  SizedBox(
                    height: productCardHeight,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return const ProductCard(
                          height: productCardHeight,
                        );
                      },
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: false,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                    ),
                    items: [
                      Image.asset("assets/images/top_banner1.png"),
                    ],
                  ),
                  TitleAndSeeAll(
                    seeAllFunction: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Products(screenTitle: "New Arrivals", search: () {}),
                    )),
                    sectionTitle: "New Arrivals",
                  ),
                  SizedBox(
                    height: productCardHeight,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return const ProductCard(
                          height: productCardHeight,
                        );
                      },
                    ),
                  ),
                  TitleAndSeeAll(
                    seeAllFunction: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Products(
                          screenTitle: "Top Rated Products", search: () {}),
                    )),
                    sectionTitle: "Top Rated Products",
                  ),
                  SizedBox(
                    height: productCardHeight,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return const ProductCard(
                          height: productCardHeight,
                        );
                      },
                    ),
                  ),
                  TitleAndSeeAll(
                    seeAllFunction: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Products(
                          screenTitle: "Special Offers", search: () {}),
                    )),
                    sectionTitle: "Special Offers",
                  ),
                  SizedBox(
                    height: productCardHeight,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return const ProductCard(
                          height: productCardHeight,
                          isDiscounted: true,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(horizontalPadding),
              width: MediaQuery.of(context).size.width,
              color: const Color(secondaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TitleAndSeeAll(
                    seeAllFunction: () {},
                    sectionTitle: "Latest Blogs",
                    hideSeeAll: true,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const BlogsCard();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomButton(
                      buttonText: "See All Blogs",
                      buttonMethod: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Blogs(),
                      )),
                      buttonType: ButtonType.secondary,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
