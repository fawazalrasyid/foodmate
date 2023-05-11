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

  final userDailyJournal = <String, dynamic>{}.obs;

  TextEditingController foodPortionCtrl = TextEditingController();
  TextEditingController foodWeightCtrl = TextEditingController();

  final calorie = 0.obs;
  final protein = 0.obs;
  final carbohydrates = 0.obs;
  final fat = 0.obs;

  @override
  void onInit() {
    user = auth.currentUser;
    getData();
    userDailyJournal['calorie'] = 0;
    getUserDailyjournal();
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

    // init food data
    foodPortionCtrl.text = "1";
    foodWeightCtrl.text = (fd.servingSize!.toInt()).toString();

    calculateNutritions();
  }

  void getUserDailyjournal() async {
    DateTime now = DateTime.now();
    String date = DateFormat('ddMMyyyy').format(now);

    final usersRef = FirebaseFirestore.instance.collection('users');
    final currentUser = await usersRef
        .doc(user!.uid)
        .collection("dailyjournal")
        .doc(date)
        .get();
    userDailyJournal.value = currentUser.data() as Map<String, dynamic>;
  }

  void calculateNutritions() {
    var fd = foodData.data!;

    var servingSize = fd.servingSize!;
    var portion =
        int.parse(foodPortionCtrl.text.isNotEmpty ? foodPortionCtrl.text : '0');
    var weight =
        int.parse(foodWeightCtrl.text.isNotEmpty ? foodWeightCtrl.text : '0');

    calorie.value =
        ((fd.calories!.value! / servingSize) * weight * portion).toInt();
    protein.value =
        ((fd.protein!.value! / servingSize) * weight * portion).toInt();
    carbohydrates.value =
        ((fd.carbohydrates!.value! / servingSize) * weight * portion).toInt();
    fat.value = ((fd.fat!.value! / servingSize) * weight * portion).toInt();
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

    // add total data journal
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
        'date': DateFormat('ddMMyyyy').format(now),
        'createdAt': now.toIso8601String(),
      });
    }

    var weight =
        int.parse(foodWeightCtrl.text.isNotEmpty ? foodWeightCtrl.text : '0');

    // add data to journal list
    usersRef
        .doc(user?.uid)
        .collection("dailyjournal")
        .doc(date)
        .collection("data")
        .add({
      'foodName': foodData.data!.foodName!,
      'createdAt': now.toIso8601String(),
      'weight': weight,
      'calorie': calorie.toInt(),
      'protein': protein.toInt(),
      'carbohydrates': carbohydrates.toInt(),
      'fat': fat.toInt(),
    });

    Get.offNamed(Routes.ADD_TO_JOURNAL, arguments: [
      {"image": objectImage},
      {"foodData": foodData},
      {"weight": weight}
    ]);
  }
}
