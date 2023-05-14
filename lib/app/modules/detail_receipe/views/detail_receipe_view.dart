import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../controllers/detail_receipe_controller.dart';

class DetailReceipeView extends GetView<DetailReceipeController> {
  const DetailReceipeView({Key? key}) : super(key: key);
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
            "Detail Resep",
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
                CachedNetworkImage(
                  imageUrl: controller.receipeData["img"],
                  height: Get.height * 0.45,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ],
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
                                Center(
                                  child: Text(
                                    controller.receipeData["name"],
                                    style: const TextStyle(
                                      color: Color(0xff030319),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
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
                                          "Cara Memasak",
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
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: const [
                                                  Text(
                                                    "Komposisi Makanan",
                                                    style: TextStyle(
                                                      color: Color(0xff030319),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "7 item",
                                                    style: TextStyle(
                                                      color: Color(0xff4db236),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 24),
                                              Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 64,
                                                          height: 64,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            color: const Color(
                                                                0xffe7eaf2),
                                                          ),
                                                          child: Image.asset(
                                                            'assets/images/pisang.jpeg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 12),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: const [
                                                            Text(
                                                              "Pisang",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff030319),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            Text(
                                                              "300gram",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff979797),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "DM Sans",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 64,
                                                          height: 64,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color: const Color(
                                                                0xffe7eaf2),
                                                          ),
                                                          child: Image.asset(
                                                            'assets/images/tepung.jpeg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 12),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: const [
                                                            Text(
                                                              "Tepung",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff030319),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            Text(
                                                              "400gram",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff979797),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    "DM Sans",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
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
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: const [
                                                  Text(
                                                    "Cara Memasak",
                                                    style: TextStyle(
                                                      color: Color(0xff030319),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "45 menit",
                                                    style: TextStyle(
                                                      color: Color(0xff4db236),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
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
                                                            .start,
                                                    children: const [
                                                      SizedBox(
                                                        width: 24,
                                                        height: 24,
                                                        child: Text(
                                                          "1",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff030319),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                "DM Sans",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      Expanded(
                                                        child: Text(
                                                          "Lumatkan pisang dengan garpu. Tidak usah sampai terlalu lembut, cukup sampai hancur saja. Sisihkan.",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff898d9b),
                                                            fontSize: 14,
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
                                                            .start,
                                                    children: const [
                                                      SizedBox(
                                                        width: 24,
                                                        height: 24,
                                                        child: Text(
                                                          "2",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff030319),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                "DM Sans",
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      Expanded(
                                                        child: Text(
                                                          "Campur semua bahan jadi satu, lalu masukan pisang yg sudah dilumatkan. Aduk hingga semua bahan tercampur rata.",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff898d9b),
                                                            fontSize: 14,
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
          ],
        ),
      ),
    );
  }
}
