import 'dart:io';

import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/widgets/back_button.dart';
import 'package:ecommerce_practice/widgets/custom_button.dart';
import 'package:ecommerce_practice/widgets/custom_image_input.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:ecommerce_practice/widgets/custom_text_field.dart';
import 'package:ecommerce_practice/widgets/google_btn.dart';
import 'package:ecommerce_practice/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_practice/widgets/extensions.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  File? temporaryImagePath;

  String? errorText = "";

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Full Name is required";
    }

    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email Address is required";
    } else if (!value.isValidEmail()) {
      return "Invalid Email Address";
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < passwordLength) {
      return "Password must be atleast $passwordLength characters.";
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < passwordLength) {
      return "Password must be atleast $passwordLength characters.";
    } else if (value != _passwordController.text) {
      return "Does not match password";
    }
    return null;
  }

  Future<void> pickImage(ImageSource source) async {
    Navigator.pop(context);

    final image = await ImagePicker()
        .pickImage(source: source, preferredCameraDevice: CameraDevice.front);

    if (image == null) return;

    setState(() {
      temporaryImagePath = File(image.path);
    });
  }

  void _signUpMethod() async {
    if (temporaryImagePath == null) {
      setState(() {
        errorText = "Profile Picture is required";
      });
    } else {
      setState(() {
        errorText = null;
      });
    }
    if (_signUpFormKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                backButton(context),
                Form(
                  key: _signUpFormKey,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(horizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: verticalPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              CustomText(
                                text: "Welcome to\nE-COMM APP",
                                textColor: Color(primaryFontColor),
                                textType: TextType.heading1,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: verticalPadding),
                                child: CustomText(
                                  text: "Please enter data to register",
                                  textColor: Color(secondaryFontColor),
                                  textType: TextType.heading2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: GoogleButton(
                            text: "Sign Up With Google",
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50,
                            successMessage: "Registered Successfully",
                          ),
                        ),
                        const TextDivider(
                          text: "OR",
                          topPadding: verticalPadding,
                          bottomPadding: verticalPadding,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: verticalPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Full Name",
                                textColor: Color(primaryFontColor),
                                textType: TextType.boldText,
                              ),
                              CustomTextField(
                                textController: _nameController,
                                labelText: "Enter Full Name",
                                topMargin: verticalPadding,
                                textInputAction: TextInputAction.next,
                                validationMethod: _nameValidator,
                              ),
                            ],
                          ),
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
                                textInputAction: TextInputAction.next,
                                validationMethod: _emailValidator,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: verticalPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Password",
                                textColor: Color(primaryFontColor),
                                textType: TextType.boldText,
                              ),
                              CustomTextField(
                                textController: _passwordController,
                                labelText: "Enter Password",
                                topMargin: verticalPadding,
                                textInputAction: TextInputAction.next,
                                validationMethod: _passwordValidator,
                                suffix: InkWell(
                                  onTap: () => setState(() {
                                    _showPassword = !_showPassword;
                                  }),
                                  child: _showPassword
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: Color(secondaryFontColor),
                                        )
                                      : const Icon(
                                          Icons.visibility_outlined,
                                          color: Color(secondaryFontColor),
                                        ),
                                ),
                                isPassword: !_showPassword,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: verticalPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Confirm Password",
                                textColor: Color(primaryFontColor),
                                textType: TextType.boldText,
                              ),
                              CustomTextField(
                                textController: _confirmpasswordController,
                                labelText: "Enter Confirm Password",
                                topMargin: verticalPadding,
                                validationMethod: _confirmPasswordValidator,
                                suffix: InkWell(
                                  onTap: () => setState(() {
                                    _showConfirmPassword =
                                        !_showConfirmPassword;
                                  }),
                                  child: _showConfirmPassword
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: Color(secondaryFontColor),
                                        )
                                      : const Icon(
                                          Icons.visibility_outlined,
                                          color: Color(secondaryFontColor),
                                        ),
                                ),
                                isPassword: !_showConfirmPassword,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: verticalPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Profile Picture",
                                textColor: Color(primaryFontColor),
                                textType: TextType.boldText,
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: verticalPadding)),
                              CustomImageInput(
                                errorText: errorText,
                                pickImageMethod: pickImage,
                                temporaryImagePath: temporaryImagePath,
                              ),
                            ],
                          ),
                        ),
                        CustomButton(
                          buttonText: "Sign Up",
                          buttonMethod: _signUpMethod,
                          buttonType: ButtonType.primary,
                          bottomMargin: verticalPadding,
                          topMargin: verticalPadding,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
