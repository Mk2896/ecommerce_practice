import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/screens/forget_password.dart';
import 'package:ecommerce_practice/screens/signup.dart';
import 'package:ecommerce_practice/widgets/back_button.dart';
import 'package:ecommerce_practice/widgets/custom_button.dart';
import 'package:ecommerce_practice/widgets/custom_text.dart';
import 'package:ecommerce_practice/widgets/custom_text_field.dart';
import 'package:ecommerce_practice/widgets/google_btn.dart';
import 'package:ecommerce_practice/widgets/text_divider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_practice/widgets/extensions.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool _showPassword = false;

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

  void _loginMethod() {
    if (_loginFormKey.currentState!.validate()) {}
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
                  key: _loginFormKey,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(horizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: verticalPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              CustomText(
                                text: "Welcome back to\nE-COMM APP",
                                textColor: Color(primaryFontColor),
                                textType: TextType.heading1,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: verticalPadding),
                                child: CustomText(
                                  text: "Please enter data to login",
                                  textColor: Color(secondaryFontColor),
                                  textType: TextType.heading2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: GoogleButton(
                            text: "Sign In With Google",
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50,
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
                        CustomButton(
                          buttonText: "Sign In",
                          buttonMethod: _loginMethod,
                          buttonType: ButtonType.primary,
                          bottomMargin: verticalPadding,
                          topMargin: verticalPadding,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgetPassword(),
                        )),
                        child: const CustomText(
                          text: "Forget Password",
                          textColor: Color(primaryFontColor),
                          textType: TextType.boldText,
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        )),
                        child: const CustomText(
                          text: "Sign Up",
                          textColor: Color(primaryColor),
                          textType: TextType.boldText,
                        ),
                      ),
                    ],
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
