import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/category_icon.dart';
import 'package:ecommerce_practice/widgets/custom_button.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:ecommerce_practice/widgets/my_app_bar.dart';
import 'package:ecommerce_practice/widgets/news_card.dart';
import 'package:ecommerce_practice/widgets/product_card.dart';
import 'package:ecommerce_practice/widgets/search.dart';
import 'package:ecommerce_practice/widgets/title_see_all.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(backgroundColor),
      appBar: myAppBar(
        context: context,
      ),
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
                  Search(searchFormKey: searchFormKey),
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
                      seeAllFunction: () {}, sectionTitle: "Categories"),
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
                    seeAllFunction: () {},
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
                    seeAllFunction: () {},
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
                    seeAllFunction: () {},
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
                    seeAllFunction: () {},
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
                    seeAllFunction: () {},
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
                    sectionTitle: "Latest News",
                    hideSeeAll: true,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const NewsCard();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomButton(
                      buttonText: "See All News",
                      buttonMethod: () {},
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
