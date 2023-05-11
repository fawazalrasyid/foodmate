import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodmate/app/core/values/app_values.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

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
            color: AppColors.black,
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
              height: Get.height * 0.66,
              width: Get.width,
              padding: const EdgeInsets.all(16),
              color: const Color(0xffe2fbdc),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Baik di konsumsi sebelum !",
                    style: TextStyle(
                      color: Color(0xff4db236),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    DateFormat('d MMMM yyyy')
                        .format(DateTime.now().add(const Duration(days: 1))),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color(0xff4db236),
                      fontSize: 14,
                      fontFamily: "DM Sans",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
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
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Center(
                    child: Container(
                      width: 48,
                      height: 8.88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xfff2f2f2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppValues.padding,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                  "Ukuran Penyajian",
                                  style: TextStyle(
                                    color: AppColors.textSubtitleColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0xffe7eaf2),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: Get.width * 0.3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.white,
                                              ),
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller:
                                                    controller.foodPortionCtrl,
                                                onChanged: (text) => controller
                                                    .calculateNutritions(),
                                                decoration: InputDecoration(
                                                  enabled: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xffe7eaf2),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: AppColors
                                                          .focusedTextFieldBorderColor,
                                                    ),
                                                  ),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              "porsi",
                                              style: TextStyle(
                                                color: Color(0xff979797),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 24),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0xffe7eaf2),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: Get.width * 0.3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.white,
                                              ),
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller:
                                                    controller.foodWeightCtrl,
                                                onChanged: (text) => controller
                                                    .calculateNutritions(),
                                                decoration: InputDecoration(
                                                  enabled: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xffe7eaf2),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: AppColors
                                                          .focusedTextFieldBorderColor,
                                                    ),
                                                  ),
                                                  border: InputBorder.none,
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: const Color(0xffe7eaf2),
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
                                              color: const Color(0xffe7eaf2),
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
                                              color: const Color(0xffe7eaf2),
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
                                              color: const Color(0xffe7eaf2),
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
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.5,
                            child: DefaultTabController(
                              length: 2,
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: AppValues.padding,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.tabBarColor,
                                    ),
                                    child: TabBar(
                                      unselectedLabelColor:
                                          AppColors.tabBarTextColor,
                                      labelColor:
                                          AppColors.selectedTabBarTextColor,
                                      labelPadding: const EdgeInsets.fromLTRB(
                                          20, 16, 20, 16),
                                      indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xff25293C),
                                      ),
                                      indicatorColor:
                                          AppColors.selectedTabBarColor,
                                      indicatorWeight: 3,
                                      tabs: const [
                                        Text(
                                          "Komposisi",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "Tips Olah & Simpan",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(
                                            AppValues.padding,
                                          ),
                                          child: Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      Text(
                                                        "Komposisi Makanan",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff030319),
                                                          fontSize: 18,
                                                          fontFamily: "DM Sans",
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        "7 item",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff4db236),
                                                          fontSize: 14,
                                                          fontFamily: "DM Sans",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  const Text(
                                                    "Berikut adalah komposisi makanan yang dapat kami perkirakan.",
                                                    style: TextStyle(
                                                      color: Color(0xff8f92a1),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 24),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xfff4f6fb),
                                                              width: 1,
                                                            ),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0x050c0d2a),
                                                                blurRadius: 8,
                                                                offset: Offset(
                                                                    0, 4),
                                                              ),
                                                              BoxShadow(
                                                                color: Color(
                                                                    0x050c0d2b),
                                                                blurRadius: 8,
                                                                offset: Offset(
                                                                    0, -4),
                                                              ),
                                                            ],
                                                            color: Colors.white,
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                width: 40,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  color: const Color(
                                                                      0xffe7eaf2),
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/nasi.jpeg',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 12),
                                                              const Text(
                                                                "Nasi",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff030319),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 12),
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xfff4f6fb),
                                                              width: 1,
                                                            ),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0x050c0d2a),
                                                                blurRadius: 8,
                                                                offset: Offset(
                                                                    0, 4),
                                                              ),
                                                              BoxShadow(
                                                                color: Color(
                                                                    0x050c0d2b),
                                                                blurRadius: 8,
                                                                offset: Offset(
                                                                    0, -4),
                                                              ),
                                                            ],
                                                            color: Colors.white,
                                                          ),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                width: 40,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  color: const Color(
                                                                      0xffe7eaf2),
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/sayur.jpeg',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 12),
                                                              const Text(
                                                                "Sayur",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xff030319),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(
                                              AppValues.padding),
                                          child: Column(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Tips Olah & Simpan",
                                                    style: TextStyle(
                                                      color: Color(0xff030319),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      Text(
                                                        "Waktu simpan yang kami sarankan : ",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff8f92a1),
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        "1 hari",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff4db236),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 24),
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      SizedBox(
                                                        width: 24,
                                                        height: 24,
                                                        child: Icon(
                                                          IconlyBold
                                                              .info_square,
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      SizedBox(
                                                        child: Text(
                                                          "Simpan di suhu ruangan",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff030319),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      SizedBox(
                                                        width: 24,
                                                        height: 24,
                                                        child: Icon(
                                                          IconlyBold
                                                              .info_square,
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      SizedBox(
                                                        child: Text(
                                                          "Letakkan di tempat kering",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff030319),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      SizedBox(
                                                        width: 24,
                                                        height: 24,
                                                        child: Icon(
                                                          IconlyBold
                                                              .info_square,
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      SizedBox(
                                                        child: Text(
                                                          "Rendam sayuran di dalam air",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff030319),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: const [
                                                      SizedBox(
                                                        width: 24,
                                                        height: 24,
                                                        child: Icon(
                                                          IconlyBold
                                                              .info_square,
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      SizedBox(
                                                        child: Text(
                                                          "Pisahkan sayuran dan dressing",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff030319),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
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
                      Row(
                        children: [
                          const Text(
                            "Kalori kamu menjadi : ",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "${controller.userDailyJournal['calorie'] + controller.calorie.toInt()} cal",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
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
