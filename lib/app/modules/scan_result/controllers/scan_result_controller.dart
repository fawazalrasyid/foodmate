import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/model/predict_object_model.dart';
import '../../../routes/app_pages.dart';

class ScanResultController extends GetxController {
  late var argumentData;
  late Rx<XFile?> objectImage = Rx<XFile?>(null);
  late PredictObjectResponseModel foodData;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  TextEditingController foodWeightCtrl = TextEditingController();

  final calorie = 0.obs;
  final protein = 0.obs;
  final carbohydrates = 0.obs;
  final fat = 0.obs;

  @override
  void onInit() {
    getData();
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
    objectImage = argumentData[0]['image'];
    foodData = argumentData[1]['foodData'];

    var fd = foodData.data!;

    // init food weight
    foodWeightCtrl.text = (fd.servingSize!.toInt()).toString();

    calculateNutritions();
  }

  void calculateNutritions() {
    var fd = foodData.data!;

    var servingSize = fd.servingSize!;
    var weight =
        int.parse(foodWeightCtrl.text.isNotEmpty ? foodWeightCtrl.text : '0');

    calorie.value = ((fd.calories!.value! / servingSize) * weight).toInt();
    protein.value = ((fd.protein!.value! / servingSize) * weight).toInt();
    carbohydrates.value =
        ((fd.carbohydrates!.value! / servingSize) * weight).toInt();
    fat.value = ((fd.fat!.value! / servingSize) * weight).toInt();
  }

  Future saveToJurnal() async {
    DateTime now = DateTime.now();
    String date = DateFormat('ddMMyyyy').format(now);
    user = auth.currentUser;

    final usersRef = FirebaseFirestore.instance.collection('users');

    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await usersRef
        .doc(user?.uid)
        .collection("dailyjournal")
        .doc(date)
        .get();

    if (documentSnapshot.exists) {
      usersRef.doc(user?.uid).collection("dailyjournal").doc(date).update({
        'calorie': documentSnapshot['calorie'] + calorie.toInt(),
        'protein': documentSnapshot['protein'] + protein.toInt(),
        'carbohydrates':
            documentSnapshot['carbohydrates'] + carbohydrates.toInt(),
        'fat': documentSnapshot['fat'] + fat.toInt(),
      });
    } else {
      usersRef.doc(user?.uid).collection("dailyjournal").doc(date).set({
        'calorie': calorie.toInt(),
        'protein': protein.toInt(),
        'carbohydrates': carbohydrates.toInt(),
        'fat': fat.toInt(),
      });
    }

    var weight =
        int.parse(foodWeightCtrl.text.isNotEmpty ? foodWeightCtrl.text : '0');

    Get.offNamed(Routes.ADD_TO_JOURNAL, arguments: [
      {"image": objectImage},
      {"foodData": foodData},
      {"weight": weight}
    ]);
  }
}
