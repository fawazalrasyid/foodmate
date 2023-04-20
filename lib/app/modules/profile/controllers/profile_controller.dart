import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodmate/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  late final userData;

  @override
  void onInit() {
    user = auth.currentUser;
    getUserData();
    super.onInit();
  }

  getUserData() async {
    final usersRef = FirebaseFirestore.instance.collection('users');
    final data = await usersRef
        .doc(user!.uid)
        .collection("userinfo")
        .doc("health")
        .get();

    userData = data.data() as Map<String, dynamic>;
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.SIGNIN);
  }
}
