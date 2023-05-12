import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';

class DetailReceipeController extends GetxController {
  late var argumentData;
  final userDailyJournal = <String, dynamic>{}.obs;

  TextEditingController foodPortionCtrl = TextEditingController();
  TextEditingController foodWeightCtrl = TextEditingController();

  var receipeData = {};

  final calorie = 0.obs;
  final protein = 0.obs;
  final carbohydrates = 0.obs;
  final fat = 0.obs;

  @override
  void onInit() {
    getData();
    userDailyJournal['calorie'] = 0;
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
    receipeData = argumentData[0]['data'];
  }
}
