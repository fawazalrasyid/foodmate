import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodmate/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/model/user_model.dart';

class OnboardingController extends GetxController {
  TextEditingController bodyHeightCtrl = TextEditingController();
  TextEditingController bodyWeightCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();
  TextEditingController genderCtrl = TextEditingController();
  TextEditingController allergiesCtrl = TextEditingController();
  TextEditingController medicalHistoryCtrl = TextEditingController();
  final selectedGender = 'L'.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  User? user;
  UserModel? userData;

  final indexWidget = 0.obs;
  final isValidForm = false.obs;

  void nextWidget() => indexWidget.value <= 1 ? indexWidget.value++ : null;

  checkIsValidForm() {
    isValidForm.value = bodyHeightCtrl.text.isNotEmpty &&
        bodyWeightCtrl.text.isNotEmpty &&
        ageCtrl.text.isNotEmpty;
  }

  // final usersRef = FirebaseFirestore.instance
  //     .collection('users')
  //     .withConverter<UserModel>(
  //       fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
  //       toFirestore: (movie, _) => movie.toJson(),
  //     );

  // Future getCurrentUser() async {
  //   user = auth.currentUser;

  //   userData = await usersRef
  //       .doc(user?.uid)
  //       .get()
  //       .then((snapshot) => snapshot.data()!);

  //   userData;
  // }

  void saveUserDataToFirestore() {
    user = auth.currentUser;
    final usersRef = FirebaseFirestore.instance.collection('users');
    usersRef.doc(user?.uid).collection("userinfo").doc("health").set({
      'bodyHeight': int.parse(bodyHeightCtrl.text),
      'bodyWeight': int.parse(bodyWeightCtrl.text),
      'age': int.parse(ageCtrl.text),
      'gender': selectedGender.value,
      'allergies': allergiesCtrl.text.isNotEmpty ? allergiesCtrl.text : '-',
      'medicalHistory':
          medicalHistoryCtrl.text.isNotEmpty ? medicalHistoryCtrl.text : '-',
    });

    usersRef.doc(user?.uid).update({
      'isFillHealthData': true,
    });

    Get.offAllNamed(Routes.MAIN);
  }
}
