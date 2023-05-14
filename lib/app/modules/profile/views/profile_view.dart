import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmate/app/core/values/app_colors.dart';
import 'package:foodmate/app/routes/app_pages.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppValues.padding),
              color: AppColors.colorPrimary,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            width: Get.width * 0.3,
                            height: Get.width * 0.3,
                            child: SvgPicture.asset(
                              'assets/images/avatar.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              "${controller.user!.displayName}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
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
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.QUESTS),
                      child: Container(
                        padding: const EdgeInsets.all(AppValues.padding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xffede4fd),
                            width: 1,
                          ),
                          color: const Color(0x7fffffff),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/ic_badges.svg",
                                        width: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        "Badges",
                                        style: TextStyle(
                                          color: Color(0xff21383e),
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "28",
                                    style: TextStyle(
                                      color: Color(0xff2e2f38),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/ic_poin.svg",
                                        width: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        "Poin",
                                        style: TextStyle(
                                          color: Color(0xff21383e),
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "1800",
                                    style: TextStyle(
                                      color: Color(0xff2e2f38),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Preferensi",
                      style: TextStyle(
                        color: Color(0xfff4f6fb),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color(0xfffe860a),
                              width: 1,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x16151a47),
                                blurRadius: 16,
                                offset: Offset(0, 8),
                              ),
                            ],
                            color: const Color(0xfff4f6fb),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Good Fats",
                                style: TextStyle(
                                  color: Color(0xfffe860a),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppValues.padding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Data Personal",
                        style: TextStyle(
                          color: Color(0xff030319),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Edit",
                        style: TextStyle(
                          color: Color(0xff4db236),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(AppValues.padding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xfff2e2ff),
                        width: 1,
                      ),
                      color: const Color(0x54ffffff),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Jenis Kelamin",
                                    style: TextStyle(
                                      color: Color(0xbf6d7278),
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    controller.userData!["gender"] == "L"
                                        ? "Laki-Laki"
                                        : "Perempuan",
                                    style: const TextStyle(
                                      color: Color(0xff25293c),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Usia",
                                    style: TextStyle(
                                      color: Color(0xbf6d7278),
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "${controller.userData!["age"]} tahun",
                                    style: const TextStyle(
                                      color: Color(0xff25293c),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Tinggi Badan",
                                    style: TextStyle(
                                      color: Color(0xbf6d7278),
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "${controller.userData!["bodyHeight"]} cm",
                                    style: const TextStyle(
                                      color: Color(0xff25293c),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Berat Badan",
                                    style: TextStyle(
                                      color: Color(0xbf6d7278),
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "${controller.userData!["bodyWeight"]} kg",
                                    style: const TextStyle(
                                      color: Color(0xff25293c),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(thickness: 1),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Alergi",
                              style: TextStyle(
                                color: Color(0xbf6d7278),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              controller.userData!["alergies"] ?? "-",
                              style: const TextStyle(
                                color: Color(0xff25293c),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Riwayat Penyakit",
                              style: TextStyle(
                                color: Color(0xbf6d7278),
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              controller.userData!["medicalHistory"] ?? "-",
                              style: const TextStyle(
                                color: Color(0xff25293c),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppValues.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pengaturan Lainnya",
                    style: TextStyle(
                      color: Color(0xff030319),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => {},
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
                              IconlyBold.user_3,
                              color: Color(0xff8F92A1),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          "Komunitas",
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
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => {},
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
                              IconlyBold.chart,
                              color: Color(0xff8F92A1),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          "Riwayat Program",
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
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => {},
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
                              IconlyBold.chat,
                              color: Color(0xff8F92A1),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          "FAQs",
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
                  const SizedBox(height: 16),
                  const Divider(thickness: 1),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => controller.logout(),
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
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
