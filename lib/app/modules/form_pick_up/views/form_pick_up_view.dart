import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodmate/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconly/iconly.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../controllers/form_pick_up_controller.dart';

class FormPickUpView extends GetView<FormPickUpController> {
  const FormPickUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(IconlyLight.arrow_left_2),
            splashRadius: 28,
          ),
          centerTitle: true,
          title: const Text(
            "Form Pengambilan Sampah",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff030319),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: IndexedStack(
            index: controller.formIndex.value,
            children: [
              form1(),
              form2(),
            ],
          ),
        ),
      ),
    );
  }

  Column form1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AppValues.margin,
          ),
          child: Row(
            children: [
              Container(
                width: 169,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.50),
                  color: Color(0xfffe860a),
                ),
              ),
              Container(
                width: 169,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.50),
                  color: Color(0xffe7eaf2),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Container(
          width: Get.width,
          margin: const EdgeInsets.symmetric(
            horizontal: AppValues.margin,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppValues.padding,
            vertical: AppValues.padding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Color(0xffcfd0d8),
              width: 1,
            ),
          ),
          child: Column(
            children: [
              !controller.isLoading.value
                  ? SizedBox(
                      height: 170,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: controller.userPosition,
                        onMapCreated: (GoogleMapController ctrl) {
                          controller.mapsCtrl.complete(ctrl);
                        },
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Lokasi Saya",
                    style: TextStyle(
                      color: Color(0xff030319),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Edit",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textPrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: Get.width,
                child: Text(
                  "${controller.currentAddress}",
                  style: const TextStyle(
                    color: Color(0xff575c55),
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 24),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AppValues.margin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nama Pengirim",
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
                onChanged: (text) => controller.checkIsValidForm1(),
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
              const SizedBox(height: 16),
              const Text(
                "Nomer Telepon",
                style: TextStyle(
                  color: AppColors.textSubtitleColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: controller.phoneCtrl,
                onChanged: (text) => controller.checkIsValidForm1(),
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
                  hintText: "Masukkan nomer telepon kamu",
                  hintStyle: const TextStyle(
                    color: AppColors.hintColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
        Container(
          width: Get.width,
          margin: const EdgeInsets.symmetric(horizontal: AppValues.margin),
          child: ElevatedButton(
            onPressed: controller.isValidForm1.value
                ? () => controller.nextForm()
                : null,
            style: ElevatedButton.styleFrom(
              primary: AppColors.colorPrimary,
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
    );
  }

  Column form2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AppValues.margin,
          ),
          child: Row(
            children: [
              Container(
                width: 169,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.50),
                  color: Color(0xffe7eaf2),
                ),
              ),
              Container(
                width: 169,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.50),
                  color: Color(0xfffe860a),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        GestureDetector(
          onTap: () => controller.selectOption1(),
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(
              horizontal: AppValues.padding,
            ),
            child: Image.asset(
              controller.imgOption1.value,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () => controller.selectOption2(),
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(
              horizontal: AppValues.padding,
            ),
            child: Image.asset(
              controller.imgOption2.value,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () => controller.selectOption3(),
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(
              horizontal: AppValues.padding,
            ),
            child: Image.asset(
              controller.imgOption3.value,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          width: Get.width,
          margin: const EdgeInsets.symmetric(horizontal: AppValues.margin),
          child: ElevatedButton(
            onPressed: controller.isValidForm2.value
                ? () => Get.toNamed(Routes.PICK_UP_MAP)
                : null,
            style: ElevatedButton.styleFrom(
              primary: AppColors.colorPrimary,
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
    );
  }
}
