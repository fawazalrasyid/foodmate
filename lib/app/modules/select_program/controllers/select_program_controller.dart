import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectProgramController extends GetxController {
  late var argumentData;

  final program = "".obs;

  TextEditingController eatCtrl = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final snackCboxYes = false.obs;
  final snackCboxNo = false.obs;
  final recommendationCboxYes = false.obs;
  final recommendationCboxNo = false.obs;

  final isValidForm = false.obs;

  @override
  void onInit() {
    getData();
    user = auth.currentUser;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getData() {
    // get arguments from prev page
    argumentData = Get.arguments;
    program.value = argumentData[0]['data'];
  }

  checkIsValidForm() {
    isValidForm.value = eatCtrl.text.isNotEmpty &&
        (snackCboxYes.value == true || snackCboxNo.value == true) &&
        (recommendationCboxYes.value == true ||
            recommendationCboxNo.value == true);
  }

  savePreferences() async {
    final usersRef = FirebaseFirestore.instance.collection('users');
    await usersRef.doc(user?.uid).collection("userinfo").doc("program").set({
      'selectedProgram': program.value,
      'eatPerDay': int.parse(eatCtrl.text),
      'needSnackRecommendation': snackCboxYes.value,
      'needRecommendation': recommendationCboxYes.value,
    });

    Get.back(result: 'succes');
  }
}
