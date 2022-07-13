import 'dart:developer';

import 'package:ecommerce_practice/firebase_options.dart';
import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/screens/dummy_home_page.dart';
import 'package:ecommerce_practice/screens/home_page.dart';
import 'package:ecommerce_practice/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

User? currentUser;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool activeConnection = await checkUserConnection();
  if (activeConnection) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    currentUser = FirebaseAuth.instance.currentUser;
  }
  runApp(MyApp(
    activeConnection: activeConnection,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.activeConnection}) : super(key: key);

  final bool activeConnection;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce Demo',
      home: LoaderOverlay(
        useDefaultLoading: false,
        child: !activeConnection
            ? DummyHomePage()
            : (currentUser == null ? const Login() : HomePage()),
      ),
    );
  }
}
