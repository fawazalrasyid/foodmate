import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmate/app/core/widget/menu_card.dart';
import 'package:foodmate/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../controllers/food_controller.dart';

class FoodView extends GetView<FoodController> {
  FoodView({Key? key}) : super(key: key);

  @override
  FoodController controller = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.height * 0.41,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                color: Color(0xff69be55),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppValues.margin,
                      ),
                      child: TextField(
                        controller: null,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          filled: true,
                          suffixIcon: const Icon(IconlyLight.search),
                          suffixIconColor: const Color(0xff5faa46),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.all(14),
                          hintText: "Ingin makan apa?",
                          hintStyle: const TextStyle(
                            color: Color(0xff8f92a1),
                            fontSize: 14,
                          ),
                          hoverColor: AppColors.focusedTextFieldBorderColor,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: Get.width,
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppValues.margin,
                      ),
                      padding: const EdgeInsets.all(AppValues.largePadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xfff1ffee),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Manfaatkan Bahan Makananmu!",
                            style: TextStyle(
                              color: Color(0xff030319),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Input bahan makanan yang kamu punya,\n kami akan men-generate resep makanan kamu.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff8f92a1),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: Get.width,
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        Get.toNamed(Routes.RECEIPE_SCAN),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffFE860A),
                                      elevation: 0,
                                      padding: const EdgeInsets.fromLTRB(
                                          32, 16, 32, 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      "Scan",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                child: SizedBox(
                                  width: Get.width,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffFFFFFF),
                                      elevation: 0,
                                      padding: const EdgeInsets.fromLTRB(
                                          32, 16, 32, 16),
                                      side: const BorderSide(
                                        color: Color(0xffFE860A),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      "Input",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xffFE860A),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppValues.margin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mau yang simple? Pesan Aja!",
                    style: TextStyle(
                      color: Color(0xff25293c),
                      fontSize: 18,
                      fontFamily: "DM Sans",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(AppValues.largePadding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xfff6f6f6),
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset("assets/images/ic_healthy.svg"),
                              const SizedBox(height: 16),
                              const Text(
                                "Healthy",
                                style: TextStyle(
                                  color: Color(0xff25293c),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "12 Restoran",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(AppValues.largePadding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xfff6f6f6),
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset("assets/images/ic_vegan.svg"),
                              const SizedBox(height: 16),
                              const Text(
                                "Vegan",
                                style: TextStyle(
                                  color: Color(0xff25293c),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "12 Restoran",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(AppValues.largePadding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xfff6f6f6),
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset("assets/images/ic_snackty.svg"),
                              const SizedBox(height: 16),
                              const Text(
                                "Snackty",
                                style: TextStyle(
                                  color: Color(0xff25293c),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "12 Restoran",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppValues.margin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mau yang simple? Pesan Aja!",
                    style: TextStyle(
                      color: Color(0xff25293c),
                      fontSize: 18,
                      fontFamily: "DM Sans",
                      fontWeight: FontWeight.w700,
                    ),
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
                      return MenuCard(
                        name: controller.foodList[index]["name"]!,
                        calorie: controller.foodList[index]["calorie"]!,
                        image: controller.foodList[index]["img"]!,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFFFFFF),
                        elevation: 0,
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        side: const BorderSide(
                          color: AppColors.colorPrimary,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Tampilkan lebih banyak",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
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
