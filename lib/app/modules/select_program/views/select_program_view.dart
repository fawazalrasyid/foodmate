import 'package:flutter/material.dart';
import 'package:foodmate/app/core/values/app_values.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/widget/labeled_checkbox.dart';
import '../controllers/select_program_controller.dart';

class SelectProgramView extends GetView<SelectProgramController> {
  const SelectProgramView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
        ),
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Image.asset(
              "assets/images/program_ornament.png",
              width: Get.width,
            ),
            SafeArea(
              child: Column(
                children: [
                  // const SizedBox(height: 24),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: AppValues.margin),
                    child: Column(
                      children: const [
                        Center(
                          child: Text(
                            "HealthyMate",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff69be55),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          "Beritahu Kami Preferensi-mu!",
                          style: TextStyle(
                            color: Color(0xff2a2d35),
                            fontSize: 20,
                            fontFamily: "DM Sans",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Ini digunakan agar kami bisa mempersonalisasi rekomendasi dengan lebih baik.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff82838a),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: AppValues.margin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sehari makan berapa kali?",
                          style: TextStyle(
                            color: AppColors.textSubtitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: controller.eatCtrl,
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
                            hintText: "Masukkan berapa kali kamu makan",
                            hintStyle: const TextStyle(
                              color: AppColors.hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "Apakah ingin disarankan untuk snack?",
                          style: TextStyle(
                            color: AppColors.textSubtitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            LabeledCheckbox(
                              label: "Ya",
                              value: controller.snackCboxYes.value,
                              onChanged: (bool newValue) {
                                controller.snackCboxYes.value = newValue;
                                controller.snackCboxNo.value = false;
                                controller.checkIsValidForm();
                              },
                            ),
                            LabeledCheckbox(
                              label: "Tidak",
                              value: controller.snackCboxNo.value,
                              onChanged: (bool newValue) {
                                controller.snackCboxNo.value = newValue;
                                controller.snackCboxYes.value = false;
                                controller.checkIsValidForm();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "Apakah ingin juga direkomendasikan oleh kami?",
                          style: TextStyle(
                            color: AppColors.textSubtitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            LabeledCheckbox(
                              label: "Ya",
                              value: controller.recommendationCboxYes.value,
                              onChanged: (bool newValue) {
                                controller.recommendationCboxYes.value =
                                    newValue;
                                controller.recommendationCboxNo.value = false;
                                controller.checkIsValidForm();
                              },
                            ),
                            LabeledCheckbox(
                              label: "Tidak",
                              value: controller.recommendationCboxNo.value,
                              onChanged: (bool newValue) {
                                controller.recommendationCboxNo.value =
                                    newValue;
                                controller.recommendationCboxYes.value = false;
                                controller.checkIsValidForm();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(
                        horizontal: AppValues.margin),
                    child: ElevatedButton(
                      onPressed: controller.isValidForm.value
                          ? () => controller.savePreferences()
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
                        "Simpan",
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
          ],
        ),
      ),
    );
  }
}
