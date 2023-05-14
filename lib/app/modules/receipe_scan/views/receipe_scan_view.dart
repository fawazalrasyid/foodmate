import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:foodmate/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../core/values/app_colors.dart';
import '../../scan/controllers/scan_controller.dart';

class ReceipeScanView extends GetView<ScanController> {
  ReceipeScanView({Key? key}) : super(key: key);
  @override
  final ScanController controller = Get.put(ScanController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            IconlyLight.arrow_left_2,
            color: Color(0xffffffff),
          ),
          splashRadius: 28,
        ),
        centerTitle: true,
        title: const Text(
          "Generate Recipes",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Obx(
        () => controller.isInitializeCamera.value
            ? Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: controller.objectImage == Rx<XFile?>(null)
                        ? CameraPreview(controller.cameraCtrl!)
                        : Image.file(
                            File(controller.objectImage.value!.path),
                            fit: BoxFit.cover,
                          ),
                  ),
                  // Image.asset(
                  //   "assets/images/receipe_scan.png",
                  //   width: Get.width,
                  //   fit: BoxFit.cover,
                  // ),
                  // controller.isScanning.value
                  //     ? Container(
                  //         width: Get.width,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(16),
                  //           color: Colors.white,
                  //         ),
                  //         margin: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                  //         padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  //         child: Row(
                  //           mainAxisSize: MainAxisSize.min,
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Row(
                  //               children: [
                  //                 SizedBox(
                  //                   child: Text(
                  //                     controller.textFood.value,
                  //                     style: const TextStyle(
                  //                       color: Color(0xff030319),
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w700,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 if (controller.textFood.value == "Scanning")
                  //                   Container(
                  //                     height: 28,
                  //                     width: 28,
                  //                     padding: const EdgeInsets.all(8),
                  //                     child: const CircularProgressIndicator(
                  //                       strokeWidth: 2,
                  //                     ),
                  //                   )
                  //               ],
                  //             ),
                  //             const SizedBox(width: 12),
                  //             controller.textFood.value == "Scanning"
                  //                 ? GestureDetector(
                  //                     onTap: () => controller.cancelScan(),
                  //                     child: Container(
                  //                       width: 40,
                  //                       height: 40,
                  //                       decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.circular(12),
                  //                         color: AppColors.errorColor,
                  //                       ),
                  //                       padding: const EdgeInsets.all(8),
                  //                       child: Container(
                  //                         width: 24,
                  //                         height: 24,
                  //                         decoration: BoxDecoration(
                  //                           borderRadius: BorderRadius.circular(8),
                  //                         ),
                  //                         child: const Icon(
                  //                           Icons.close,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   )
                  //                 : GestureDetector(
                  //                     onTap: () => controller.showResult(),
                  //                     child: Container(
                  //                       width: 40,
                  //                       height: 40,
                  //                       decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.circular(12),
                  //                         color: AppColors.colorPrimary,
                  //                       ),
                  //                       padding: const EdgeInsets.all(8),
                  //                       child: Container(
                  //                         width: 24,
                  //                         height: 24,
                  //                         decoration: BoxDecoration(
                  //                           borderRadius: BorderRadius.circular(8),
                  //                         ),
                  //                         child: const Icon(
                  //                           IconlyLight.arrow_right_2,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   )
                  //           ],
                  //         ),
                  //       )
                  //     : Container(
                  //         width: Get.width,
                  //         margin: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                  //         child: ElevatedButton(
                  //           onPressed: () => controller.takePicture(),
                  //           style: ElevatedButton.styleFrom(
                  //             backgroundColor: AppColors.colorPrimary,
                  //             elevation: 0,
                  //             padding: const EdgeInsets.fromLTRB(16, 20, 16, 18),
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(16),
                  //             ),
                  //           ),
                  //           child: const Text(
                  //             "Scan",
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //               color: AppColors.white,
                  //               fontSize: 16,
                  //               fontWeight: FontWeight.w700,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  Container(
                    width: Get.width,
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.RECEIPE_SCAN_RESULT),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorPrimary,
                        elevation: 0,
                        padding: const EdgeInsets.fromLTRB(16, 20, 16, 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
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
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Can't connect to the camera"),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () => controller.loadCamera(),
                      child: const Text(
                        "Try again!",
                        style: TextStyle(
                          color: Color(0xff69be55),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
