import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodmate/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  @override
  void onInit() {
    user = auth.currentUser;

    super.onInit();
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.SIGNIN);
  }
}
