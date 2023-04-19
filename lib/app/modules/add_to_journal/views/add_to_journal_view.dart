import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodmate/app/core/values/app_colors.dart';
import 'package:foodmate/app/core/values/app_values.dart';
import 'package:foodmate/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/add_to_journal_controller.dart';

class AddToJournalView extends GetView<AddToJournalController> {
  const AddToJournalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.colorPrimary,
        body: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: Get.height * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Berhasil Menambah \nke Jurnal Nutrisi!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: Get.height * 0.55,
                      margin: const EdgeInsets.symmetric(
                          horizontal: AppValues.margin),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(AppValues.smallPadding),
                        child: Column(
                          children: [
                            Container(
                              height: Get.height * 0.35,
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              child: Image.file(
                                File(controller.objectImage.value!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                          ],
                        ),
                      ),
                    )
                  ],
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
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Get.offAllNamed(Routes.MAIN),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          elevation: 0,
                          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Kembali",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Get.toNamed(Routes.JOURNAL_HISTORY),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.colorPrimary,
                          elevation: 0,
                          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Lihat Riwayat",
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
      ),
    );
  }
}
