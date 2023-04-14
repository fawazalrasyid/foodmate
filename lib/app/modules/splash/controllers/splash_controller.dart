import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodmate/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  User? user;

  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () => initPage());
    super.onInit();
  }

  Future initPage() async {
    user = auth.currentUser;

    if (user != null) {
      Get.offNamed(Routes.MAIN);
    } else {
      Get.offNamed(Routes.SIGNIN);
    }
  }
}
