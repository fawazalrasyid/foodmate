import 'package:flutter/material.dart';
import 'package:foodmate/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/menu_card.dart';
import '../controllers/receipe_scan_result_controller.dart';

class ReceipeScanResultView extends GetView<ReceipeScanResultController> {
  const ReceipeScanResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            IconlyLight.arrow_left_2,
            color: Color(0xff25293C),
          ),
          splashRadius: 28,
        ),
        centerTitle: true,
        title: const Text(
          "Generate Recipes",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff25293C),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const SizedBox(height: double.infinity),
          Container(
            height: Get.height * 0.85,
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
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: AppValues.margin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                "8 ",
                                style: TextStyle(
                                  color: AppColors.textPrimaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "Resep di generate",
                                style: TextStyle(
                                  color: Color(0xff25293c),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          GridView.builder(
                            itemCount: controller.foodList.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 24 / 25,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => Get.toNamed(
                                  Routes.DETAIL_RECEIPE,
                                  arguments: [
                                    {"data": controller.foodList[index]},
                                  ],
                                ),
                                child: MenuCard(
                                  name: controller.foodList[index]["name"]!,
                                  calorie: controller.foodList[index]
                                      ["calorie"]!,
                                  image: controller.foodList[index]["img"]!,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
