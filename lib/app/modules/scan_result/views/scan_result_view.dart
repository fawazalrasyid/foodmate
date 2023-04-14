import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmate/app/core/values/app_values.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../core/values/app_colors.dart';
import '../controllers/scan_result_controller.dart';

class ScanResultView extends GetView<ScanResultController> {
  const ScanResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(IconlyLight.arrow_left_2),
            splashRadius: 28,
          ),
          centerTitle: true,
          title: const Text(
            "Hasil",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff030319),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Column(
              children: [
                SizedBox(
                  height: Get.height * 0.45,
                  width: Get.width,
                  child: Image.file(
                    File(controller.objectImage.value!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Container(
              height: Get.height * 0.6,
              width: Get.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(AppValues.padding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Center(
                        child: Container(
                          width: 48,
                          height: 8.88,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xfff2f2f2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        controller.foodData.data!.foodName!,
                        style: const TextStyle(
                          color: Color(0xff030319),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Berikut adalah hasil perhitungan perkiraaan dari nutrisi yang akan kamu makan.",
                        style: TextStyle(
                          color: Color(0xff8f92a1),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Berat makanan",
                        style: TextStyle(
                          color: AppColors.textSubtitleColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.35,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.foodWeightCtrl,
                              onChanged: (text) =>
                                  controller.calculateNutritions(),
                              decoration: InputDecoration(
                                enabled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: AppColors.textFieldBorderColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color:
                                        AppColors.focusedTextFieldBorderColor,
                                  ),
                                ),
                                border: InputBorder.none,
                                hintText: "200 gram",
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "gram",
                            style: TextStyle(
                              color: Color(0xff979797),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xffe7eaf2),
                                  ),
                                  child: Image.asset(
                                    'assets/images/calorie.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "${controller.calorie.value} Kalori",
                                  style: const TextStyle(
                                    color: Color(0xff030319),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xffe7eaf2),
                                  ),
                                  child: Image.asset(
                                    'assets/images/protein.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "${controller.protein.value}g Protein",
                                  style: const TextStyle(
                                    color: Color(0xff030319),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xffe7eaf2),
                                  ),
                                  child: Image.asset(
                                    'assets/images/carbohydrates.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "${controller.carbohydrates.value}g Karbohidrat",
                                  style: const TextStyle(
                                    color: Color(0xff030319),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xffe7eaf2),
                                  ),
                                  child: Image.asset(
                                    'assets/images/fat.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "${controller.fat.value}g Lemak",
                                  style: const TextStyle(
                                    color: Color(0xff030319),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1907131b),
                    blurRadius: 16,
                    offset: Offset(0, -8),
                  ),
                ],
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "+${controller.calorie} Kalori",
                        style: const TextStyle(
                          color: Color(0xfffe860a),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Kalori kamu menjadi : 567 cal",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      onPressed: () => controller.saveToJurnal(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorPrimary,
                        elevation: 0,
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Tambah ke Jurnal Nutrisi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
