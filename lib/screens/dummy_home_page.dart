import 'dart:async';

import 'package:ecommerce_practice/global_constant.dart';
import 'package:ecommerce_practice/main.dart';
import 'package:ecommerce_practice/screens/home_page.dart';
import 'package:ecommerce_practice/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class DummyHomePage extends StatelessWidget {
  DummyHomePage({Key? key}) : super(key: key);

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    !context.loaderOverlay.visible
        ? context.loaderOverlay
            .show(widget: const Loading(loadingText: "Loading Please Wait.."))
        : null;

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) async {
      bool activeConnection = await checkUserConnection();
      if (activeConnection) {
        timer?.cancel();
        context.loaderOverlay.hide();
        main();
      }
    });

    return HomePage();
  }
}
