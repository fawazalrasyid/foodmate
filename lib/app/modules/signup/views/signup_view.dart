// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/labeled_checkbox.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
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
            splashRadius: 28,
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                SvgPicture.asset(
                  "assets/images/foodmate_logo.svg",
                  color: AppColors.colorPrimary,
                  width: Get.width * 0.4,
                ),
                const SizedBox(height: 24),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: AppValues.margin),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppValues.smallPadding),
                  child: Column(
                    children: const [
                      Text(
                        "Yuk, Daftarkan Dirimu!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff2a2d35),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Silahkan daftar untuk mengakses FoodMate dengan lebih baik.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff82838a),
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: AppValues.margin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Nama",
                        style: TextStyle(
                          color: AppColors.textSubtitleColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: controller.nameCtrl,
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
                          hintText: "Masukkan nama kamu",
                          hintStyle: const TextStyle(
                            color: AppColors.hintColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Email",
                        style: TextStyle(
                          color: AppColors.textSubtitleColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailCtrl,
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
                          hintText: "Masukkan email kamu",
                          hintStyle: const TextStyle(
                            color: AppColors.hintColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Password",
                        style: TextStyle(
                          color: AppColors.textSubtitleColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: controller.passwordCtrl,
                        obscureText: controller.obsecurePassword.value,
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
                          suffixIcon: IconButton(
                            onPressed: () => controller.toggleHidePassword(),
                            icon: controller.obsecurePassword.value
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            color: AppColors.iconColorDefault,
                          ),
                          border: InputBorder.none,
                          hintText: "Masukkan password kamu",
                          hintStyle: const TextStyle(
                            color: AppColors.hintColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      LabeledCheckbox(
                        label: "Saya setuju dengan syarat & ketentuan",
                        value: controller.chechkbox.value,
                        onChanged: (bool newValue) {
                          controller.chechkbox.value = newValue;
                          controller.checkIsValidForm();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: Get.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: AppValues.margin),
                  child: ElevatedButton(
                    onPressed: controller.isValidForm.value
                        ? () => controller.signup()
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
                      "Daftar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Sudah memiliki akun? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Masuk",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.colorPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
