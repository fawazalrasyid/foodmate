import 'package:flutter/material.dart';
import 'package:foodmate/app/core/values/app_values.dart';
import 'package:foodmate/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:foodmate/app/core/values/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/utils/helpers.dart';
import '../../../core/widget/medium_card.dart';
import '../../../data/model/resto_recommendation_response_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: AppValues.padding),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: AppColors.colorPrimary,
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: AppValues.margin,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.greetingText.value,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  controller.user!.displayName!,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      controller.userDailyJournal != {}
                          ? Container(
                              width: Get.width,
                              margin: const EdgeInsets.symmetric(
                                horizontal: AppValues.margin,
                              ),
                              padding: const EdgeInsets.all(
                                AppValues.padding,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xffEFF8ED),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "NutriMate",
                                        style: TextStyle(
                                          color: Color(0xff030319),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            Get.toNamed(Routes.JOURNAL_HISTORY),
                                        child: const Text(
                                          "Lihat Riwayat",
                                          style: TextStyle(
                                            color: AppColors.textPrimaryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      SizedBox(
                                        height: 170,
                                        child: SfCircularChart(
                                          centerY: '95%',
                                          series: controller
                                              .getSemiDoughnutSeries(),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${controller.userDailyJournal['calorie'] ?? 0}",
                                                textAlign: TextAlign.end,
                                                style: const TextStyle(
                                                  color: Color(0xff030319),
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const Text(
                                                " kcal",
                                                // textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xff030319),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "dari ${controller.dailyCalorieIntake.value.toInt()} kalori harian",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Color(0xff8f92a1),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: const Color(0xfff6c8cb),
                                              width: 1,
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${controller.userDailyJournal['carbohydrates'] ?? 0}g",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Color(0xff030319),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              const Text(
                                                "Karbohidrat",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xff8f92a1),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: const Color(0xff9e92e9),
                                              width: 1,
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${controller.userDailyJournal['protein'] ?? 0}g",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Color(0xff030319),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              const Text(
                                                "Protein",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xff8f92a1),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: const Color(0xff84baff),
                                              width: 1,
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${controller.userDailyJournal['fat'] ?? 0}g",
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  color: Color(0xff030319),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              const Text(
                                                "Lemak",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xff8f92a1),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      const SizedBox(height: 24),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppValues.padding,
                        ),
                        child: Image.asset(
                          'assets/images/meal_plan_banner.png',
                          fit: BoxFit.fill,
                        ),
                      ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Rekomendasi Resto Sehat",
                      style: TextStyle(
                        color: Color(0xff030319),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 46),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.RESTO, arguments: [
                        {"resto": controller.resto.value},
                      ]),
                      child: const Text(
                        "Lihat Semua",
                        style: TextStyle(
                          color: AppColors.textPrimaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              controller.isLoading.value
                  ? const SizedBox(
                      height: 210,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : controller.resto != Rxn<List<Result>>()
                      ? SizedBox(
                          height: 210,
                          child: ListView.builder(
                            itemCount: controller.resto.value!.length <= 5
                                ? controller.resto.value!.length
                                : 5,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return MediumCard(
                                index: index,
                                isLast: index == 4,
                                name: controller.resto.value![index].name!,
                                image: controller
                                        .resto.value![index].photos!.isNotEmpty
                                    ? getPhotoFromGmap(controller
                                        .resto
                                        .value![index]
                                        .photos!
                                        .first
                                        .photoReference)
                                    : "https://lh5.googleusercontent.com/p/AF1QipP9fSLK3eLQHrX8hFeQd3JdZek1O9Woz0FAQbXo=w408-h306-k-no",
                              );
                            },
                          ),
                        )
                      : const SizedBox(
                          height: 210,
                          child: Center(
                            child: Text(
                              "Belum ada rekomendasi resto di sekitar anda",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff030319),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
