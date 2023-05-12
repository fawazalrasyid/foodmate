import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../data/model/predict_object_model.dart';
import '../../../data/service/predict_object_service.dart';
import '../../../routes/app_pages.dart';

enum ScannerState { idle, progress, complete, notfound }

class ReceipeScanController extends GetxController {
  late final PredictObjectService _predictObjectService;

  final isScanning = false.obs;

  late Rx<XFile?> objectImage = Rx<XFile?>(null);

  List<CameraDescription>? cameras;
  CameraController? cameraCtrl;
  XFile? image;

  final textFood = "Scanning".obs;
  final textCal = "Loading...".obs;

  late PredictObjectResponseModel foodData;

  @override
  void onInit() {
    _predictObjectService = Get.put(PredictObjectService());
    loadCamera();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loadCamera() async {
    cameras = await availableCameras();

    if (cameras != null) {
      cameraCtrl = CameraController(
        cameras![0],
        ResolutionPreset.max,
        enableAudio: false,
      );

      cameraCtrl!.initialize().then((_) {}).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              Fluttertoast.showToast(msg: "Akses kamera ditolak");
              break;
            default:
              Fluttertoast.showToast(msg: "Terjadi masalah, coba lagi");
              break;
          }
        }
      });
    }
  }

  takePicture() async {
    objectImage.value = await cameraCtrl!.takePicture();

    predictObject();
  }

  predictObject() async {
    isScanning.value = true;

    textFood.value = "Scanning";

    var response = await _predictObjectService.predict(
      objectImage.value!.path,
    );

    if (response != null && response.status == "OK") {
      if (response.data!.foodName == null ||
          response.data!.calories?.value == null) {
        Fluttertoast.showToast(msg: 'Data makanan tidak ditemukan');
        objectImage = Rx<XFile?>(null);
        isScanning.value = false;
      }

      foodData = response;
      textFood.value = foodData.data!.foodName!;
      response = null;
    } else {
      Fluttertoast.showToast(msg: 'Data makanan tidak ditemukan');
      objectImage = Rx<XFile?>(null);
      isScanning.value = false;
    }
  }

  void showResult() {
    Get.toNamed(Routes.SCAN_RESULT, arguments: [
      {"image": objectImage},
      {"foodData": foodData}
    ]);

    Timer(const Duration(milliseconds: 500), () {
      isScanning.value = false;
      objectImage = Rx<XFile?>(null);
      foodData = PredictObjectResponseModel(
        data: null,
        msg: null,
        status: null,
      );
    });
  }

  void cancelScan() {
    isScanning.value = false;
    cameraCtrl!.initialize();
    objectImage = Rx<XFile?>(null);
    foodData = PredictObjectResponseModel(
      data: null,
      msg: null,
      status: null,
    );
  }
}
