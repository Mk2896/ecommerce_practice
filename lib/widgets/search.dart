import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search({Key? key, required this.searchFormKey}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<FormState> searchFormKey;

  void _search() {
    if (searchFormKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: searchFormKey,
      child: CustomTextField(
        labelText: "Search Product Name",
        textController: _searchController,
        suffix: IconButton(
          onPressed: () => _search(),
          icon: const Icon(
            Icons.search,
            color: Color(primaryFontColor),
          ),
        ),
      ),
    );
  }
}
