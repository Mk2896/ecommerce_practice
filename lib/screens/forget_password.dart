import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/back_button.dart';
import 'package:ecommerce_practice/widgets/custom_button.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:ecommerce_practice/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_practice/widgets/extensions.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _forgetPasswordFormKey = GlobalKey<FormState>();

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email Address is required";
    } else if (!value.isValidEmail()) {
      return "Invalid Email Address";
    }

    return null;
  }

  void _resetPasswordMethod() {
    if (_forgetPasswordFormKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                backButton(context),
                Expanded(
                  child: Form(
                    key: _forgetPasswordFormKey,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(horizontalPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              CustomText(
                                text: "Reset Password",
                                textColor: Color(primaryFontColor),
                                textType: TextType.heading1,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: verticalPadding),
                                child: CustomText(
                                  text: "Enter Email to reset your password",
                                  textColor: Color(secondaryFontColor),
                                  textType: TextType.heading2,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: verticalPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: "Email Address",
                                  textColor: Color(primaryFontColor),
                                  textType: TextType.boldText,
                                ),
                                CustomTextField(
                                  textController: _emailController,
                                  labelText: "Enter Email Address",
                                  topMargin: verticalPadding,
                                  keyboardType: TextInputType.emailAddress,
                                  validationMethod: _emailValidator,
                                ),
                                CustomButton(
                                  buttonText: "Send Reset Password Link",
                                  buttonMethod: _resetPasswordMethod,
                                  buttonType: ButtonType.primary,
                                  topMargin: verticalPadding * 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
