// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:foodmate/app/core/values/app_colors.dart';
import 'package:foodmate/app/core/values/app_values.dart';
import 'package:foodmate/app/routes/app_pages.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.indexWidget.value,
          children: [
            onboarding(),
            form1(),
            form2(),
          ],
        ),
      ),
    );
  }

  Column onboarding() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.asset(
              "assets/images/onboarding_ornament.png",
              width: Get.width,
            ),
            const SizedBox(height: 20),
            SvgPicture.asset(
              "assets/images/foodmate_logo.svg",
              color: AppColors.colorPrimary,
              width: Get.width * 0.4,
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppValues.margin),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.smallPadding),
              child: Column(
                children: const [
                  Text(
                    "Siap untuk Hidup Sehat \n& Berkelanjutan?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff2a2d35),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Tetap termotivasi dengan personalisasi rekomendasi nutrisi makanan, dan buat sisa makananmu jadi lebih bermakna.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff82838a),
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Container(
          width: Get.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x1907131b),
                blurRadius: 16,
                offset: Offset(0, -8),
              ),
            ],
            color: AppColors.darkGrey,
          ),
          child: SafeArea(
            top: false,
            bottom: true,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.MAIN),
                          child: const Text(
                            "Lewati",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.colorPrimary,
                      elevation: 0,
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      controller.nextWidget();
                    },
                    child: const Text(
                      "Mulai",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textColorWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  SafeArea form1() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppValues.margin),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.50),
                      color: const Color(0xfffe860a),
                    ),
                  ),
                ),
                // const SizedBox(width: 4),
                // Expanded(
                //   child: Container(
                //     height: 5,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(2.50),
                //       color: const Color(0xffe7eaf2),
                //     ),
                //   ),
                // ),
                // const SizedBox(width: 16),
                // const Text(
                //   "Lewati",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     color: Color(0xff1ec0ce),
                //     fontSize: 14,
                //     fontWeight: FontWeight.w700,
                //   ),
                // )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(height: 24),
                        Text(
                          "Lengkapi Data Tubuhmu!",
                          style: TextStyle(
                            color: Color(0xff2a2d35),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 328,
                          child: Text(
                            "Ini digunakan agar kami bisa mempersonalisasi rekomendasi dengan lebih baik.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff82838a),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tinggi Badan",
                          style: TextStyle(
                            color: AppColors.textSubtitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: controller.bodyHeightCtrl,
                          onChanged: (text) => controller.checkIsValidForm(),
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
                                color: AppColors.focusedTextFieldBorderColor,
                              ),
                            ),
                            border: InputBorder.none,
                            hintText: "Masukkan tinggi badan kamu",
                            hintStyle: const TextStyle(
                              color: AppColors.hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "Berat Badan",
                          style: TextStyle(
                            color: AppColors.textSubtitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: controller.bodyWeightCtrl,
                          onChanged: (text) => controller.checkIsValidForm(),
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
                                color: AppColors.focusedTextFieldBorderColor,
                              ),
                            ),
                            border: InputBorder.none,
                            hintText: "Masukkan berat badan kamu",
                            hintStyle: const TextStyle(
                              color: AppColors.hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Divider(),
                        const SizedBox(height: 24),
                        const Text(
                          "Umur",
                          style: TextStyle(
                            color: AppColors.textSubtitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: controller.ageCtrl,
                          onChanged: (text) => controller.checkIsValidForm(),
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
                                color: AppColors.focusedTextFieldBorderColor,
                              ),
                            ),
                            border: InputBorder.none,
                            hintText: "Masukkan umur kamu",
                            hintStyle: const TextStyle(
                              color: AppColors.hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "Jenis Kelamin",
                          style: TextStyle(
                            color: AppColors.textSubtitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField(
                          onChanged: (value) {
                            controller.selectedGender.value = value!;
                            controller.checkIsValidForm();
                          },
                          value: controller.selectedGender.value,
                          items: const [
                            DropdownMenuItem(
                              value: "L",
                              child: Text(
                                "Laki-Laki",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.textSubtitleColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "P",
                              child: Text(
                                "Perempuan",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.textSubtitleColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
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
                                color: AppColors.focusedTextFieldBorderColor,
                              ),
                            ),
                            border: InputBorder.none,
                            hintText: "Masukkan umur kamu",
                            hintStyle: const TextStyle(
                              color: AppColors.hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "Alergi",
                          style: TextStyle(
                            color: AppColors.textSubtitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: controller.allergiesCtrl,
                          onChanged: (text) => controller.checkIsValidForm(),
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
                                color: AppColors.focusedTextFieldBorderColor,
                              ),
                            ),
                            border: InputBorder.none,
                            hintText: "Tuliskan alergi kamu",
                            hintStyle: const TextStyle(
                              color: AppColors.hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "Riwayat Penyakit",
                          style: TextStyle(
                            color: AppColors.textSubtitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: controller.medicalHistoryCtrl,
                          onChanged: (text) => controller.checkIsValidForm(),
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
                                color: AppColors.focusedTextFieldBorderColor,
                              ),
                            ),
                            border: InputBorder.none,
                            hintText: "Tuliskan riwayat penyakit kamu",
                            hintStyle: const TextStyle(
                              color: AppColors.hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton(
                        onPressed: controller.isValidForm.value
                            ? controller.saveUserDataToFirestore
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.colorPrimary,
                          elevation: 0,
                          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Selanjutnya",
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  SafeArea form2() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppValues.margin),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.50),
                      color: const Color(0xfffe860a),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.50),
                      color: const Color(0xffe7eaf2),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  "Lewati",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff1ec0ce),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(height: 24),
                        Text(
                          "Apa Ketertaikan Kamu?",
                          style: TextStyle(
                            color: Color(0xff2a2d35),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          width: 328,
                          child: Text(
                            "Ini digunakan agar kami bisa mempersonalisasi rekomendasi dengan lebih baik.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff82838a),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                    const SizedBox(height: 48),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton(
                        onPressed: controller.isValidForm.value
                            ? controller.saveUserDataToFirestore
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.colorPrimary,
                          elevation: 0,
                          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Selesai",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
