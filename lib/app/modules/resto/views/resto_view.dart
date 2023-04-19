import 'package:flutter/material.dart';
import 'package:foodmate/app/core/values/app_values.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../core/widget/vertical_card.dart';
import '../../../data/model/resto_recommendation_response_model.dart';
import '../controllers/resto_controller.dart';

class RestoView extends GetView<RestoController> {
  const RestoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            IconlyLight.arrow_left_2,
            color: Color(0xff030319),
          ),
          splashRadius: 28,
        ),
        centerTitle: true,
        title: const Text(
          "Rekomendasi Resto Sehat",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff030319),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: controller.resto != Rxn<List<Result>>()
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppValues.padding),
                child: ListView.builder(
                  itemCount: controller.resto.value!.length,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return VerticalCard(
                      index: index,
                      name: controller.resto.value![index].name!,
                      image: controller.resto.value![index].photos!.isNotEmpty
                          ? controller.getRestoPhoto(controller
                              .resto.value![index].photos!.first.photoReference)
                          : "https://lh5.googleusercontent.com/p/AF1QipP9fSLK3eLQHrX8hFeQd3JdZek1O9Woz0FAQbXo=w408-h306-k-no",
                    );
                  },
                ),
              )
            : const SizedBox(
                height: 210,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}
