import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:foodmate/app/core/values/app_values.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:foodmate/app/routes/app_pages.dart';

import '../../../core/values/app_colors.dart';
import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  ScanView({Key? key}) : super(key: key);
  @override
  final ScanController controller = Get.put(ScanController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   leading: IconButton(
        //     onPressed: () => Get.back(),
        //     icon: const Icon(IconlyLight.arrow_left_2),
        //     splashRadius: 28,
        //   ),
        // ),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: AspectRatio(
                aspectRatio: controller.cameraCtrl!.value.aspectRatio,
                child: controller.cameraCtrl == null
                    ? const Center(child: Text("Loading Camera..."))
                    : controller.objectImage.value == null
                        ? CameraPreview(controller.cameraCtrl!)
                        : Image.file(
                            File(controller.objectImage.value!.path),
                            fit: BoxFit.cover,
                          ),
              ),
              // CameraView(
              //   title: 'Object Detector',
              //   text: controller.textFood.value,
              //   onImage: (inputImage) {
              //     Future.delayed(
              //       const Duration(seconds: 3),
              //       () {
              //         controller.processImage(inputImage);
              //       },
              //     );
              //   },
              //   onScreenModeChanged: controller.onScreenModeChanged,
              //   initialDirection: CameraLensDirection.back,
              //   customPaint: null,
              // ),
            ),
            controller.isScanning.value
                ? Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Text(
                            controller.textFood.value,
                            style: const TextStyle(
                              color: Color(0xff030319),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        controller.textFood.value == "Scanning..."
                            ? Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.all(8),
                                child: const CircularProgressIndicator(),
                              )
                            : GestureDetector(
                                onTap: () => controller.showResult(),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColors.colorPrimary,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          IconlyLight.arrow_right_2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                      ],
                    ),
                  )
                : Container(
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(
                      horizontal: AppValues.largeMargin,
                      vertical: 48,
                    ),
                    child: ElevatedButton(
                      onPressed: () => controller.takePicture(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorPrimary,
                        elevation: 0,
                        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
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
          ],
        ),
      ),
    );
  }
}
