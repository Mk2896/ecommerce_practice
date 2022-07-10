import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search({
    Key? key,
    required this.searchFormKey,
    required this.searchController,
    required this.labelText,
    required this.searchMethod,
  }) : super(key: key);

  final TextEditingController searchController;
  final GlobalKey<FormState> searchFormKey;
  final String labelText;
  final void Function() searchMethod;

  String? _searchValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please entter some keyword to search";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: searchFormKey,
      child: CustomTextField(
        labelText: labelText,
        textController: searchController,
        validationMethod: _searchValidator,
        suffix: IconButton(
          onPressed: searchMethod,
          icon: const Icon(
            Icons.search,
            color: Color(primaryFontColor),
          ),
        ),
      ),
    );
  }
}
