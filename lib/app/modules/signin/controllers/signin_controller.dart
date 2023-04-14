import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodmate/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  User? user;

  final isValidForm = false.obs;
  final obsecurePassword = true.obs;
  final chechkbox = false.obs;

  toggleHidePassword() {
    obsecurePassword.value = !obsecurePassword.value;
  }

  checkIsValidForm() {
    isValidForm.value = emailCtrl.text.isEmail && passwordCtrl.text.isNotEmpty;
  }

  void signin() async {
    // if (kDebugMode) {
    //   Get.offAllNamed(Routes.MAIN);
    // }

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailCtrl.text,
        password: passwordCtrl.text,
      );

      User? user = userCredential.user;

      if (user != null && user.emailVerified) {
        final usersRef = FirebaseFirestore.instance.collection('users');
        final currentUser = await usersRef.doc(user.uid).get();
        final currentUserData = currentUser.data() as Map<String, dynamic>;

        if (currentUserData['isFillHealthData']) {
          Get.offAllNamed(Routes.MAIN);
        } else {
          Get.offAllNamed(Routes.ONBOARDING);
        }
      } else if (user != null) {
        Fluttertoast.showToast(msg: 'Please verify your email');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'User tidak ditemukan');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Password salah');
      }
    }
  }
}
