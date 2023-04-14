import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  User? user;

  Stream<User?> streamAuthStatus() {
    return auth.userChanges();
  }

  final isValidForm = false.obs;
  final obsecurePassword = true.obs;
  final chechkbox = false.obs;

  toggleHidePassword() {
    obsecurePassword.value = !obsecurePassword.value;
  }

  checkIsValidForm() {
    isValidForm.value = nameCtrl.text.isNotEmpty &&
        emailCtrl.text.isEmail &&
        passwordCtrl.text.isNotEmpty &&
        chechkbox.value == true;
  }

  void signup() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailCtrl.text,
        password: passwordCtrl.text,
      );

      user = userCredential.user;

      if (user != null) {
        await user!.updateDisplayName(nameCtrl.text);
        await user!.sendEmailVerification();

        // save current userData to firestore
        saveUserDataToFirestore();
      }

      Get.back();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email');
      } else if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void saveUserDataToFirestore() {
    final usersRef = FirebaseFirestore.instance.collection('users');
    usersRef.doc(user?.uid).set({
      'id': user?.uid,
      'displayName': nameCtrl.text,
      'email': user?.email,
      'createdAt': user?.metadata.creationTime!.toIso8601String(),
      'isFillHealthData': false,
    });
  }
}
