import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmate/app/core/values/app_colors.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../../../core/values/app_values.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  @override
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppValues.padding),
              color: AppColors.colorPrimary,
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Container(
                            width: 20,
                            height: 20,
                            padding: const EdgeInsets.all(2),
                            child: const Icon(
                              Icons.settings,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Get.width * 0.3,
                      height: Get.width * 0.3,
                      child: SvgPicture.asset(
                        'assets/images/avatar.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 184,
                          child: Text(
                            "${controller.user!.displayName}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: "DM Sans",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          "Bergabung sejak ${DateFormat('d MMMM yyyy').format(controller.user!.metadata.creationTime!)}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xffe7eaf2),
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(
                horizontal: AppValues.padding,
              ),
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.fill,
              ),
            ),
            GestureDetector(
              onTap: () => controller.logout(),
              child: Container(
                padding: const EdgeInsets.all(
                  AppValues.padding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffe7eaf2),
                      ),
                      child: const SizedBox(
                        width: 20,
                        height: 20,
                        child: Icon(
                          IconlyBold.logout,
                          color: Color(0xff8F92A1),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      "Keluar Akun",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff464646),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
            // SizedBox(
            //   width: Get.width,
            //   child: Image.asset(
            //     "assets/images/profile.png",
            //     fit: BoxFit.fitWidth,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
