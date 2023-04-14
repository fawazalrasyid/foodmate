import 'dart:async';

import 'package:camera/camera.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../data/model/predict_object_model.dart';
import '../../../data/service/predict_object_service.dart';
import '../../../routes/app_pages.dart';

enum ScannerState { idle, progress, complete, notfound }

class ScanController extends GetxController {
  // late ObjectDetector _objectDetector;
  // late final RxBool _canProcess = false.obs;
  // final RxBool _isBusy = false.obs;

  // int cameraIndex = -1;
  // CameraImage? cameraImage;
  // CameraController? cameraController;

  late final PredictObjectService _predictObjectService;

  final isScanning = false.obs;

  late Rx<XFile?> objectImage = Rx<XFile?>(null);

  List<CameraDescription>? cameras;
  CameraController? cameraCtrl;
  XFile? image;

  final textFood = "Scanning...".obs;
  final textCal = "Loading...".obs;

  late PredictObjectResponseModel foodData;

  @override
  void onInit() {
    // initializeDetector(DetectionMode.stream);
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

    textFood.value = "Scanning...";

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

  // void initializeDetector(DetectionMode mode) async {
  //   const path = 'assets/ml/food_v1.tflite';
  //   final modelPath = await getModel(path);
  //   final options = LocalObjectDetectorOptions(
  //     mode: mode,
  //     modelPath: modelPath,
  //     classifyObjects: true,
  //     multipleObjects: false,
  //     confidenceThreshold: 0.5,
  //     maximumLabelsPerObject: 1,
  //   );
  //   _objectDetector = ObjectDetector(options: options);

  //   _canProcess.value = true;
  // }

  // Future<void> processImage(InputImage inputImage) async {
  //   if (!_canProcess.value) return;
  //   if (_isBusy.value) return;

  //   _isBusy.value = true;

  //   textFood.value = 'Scanning...';
  //   textCal.value = 'Scanning...';

  //   update();

  //   List<DetectedObject> objects =
  //       await _objectDetector.processImage(inputImage);

  //   if (objects.isNotEmpty) {
  //     if (objects[0].labels.isNotEmpty) {
  //       debugPrint(
  //           'detectedObject : ${objects[0].labels[0].text} confidence : ${objects[0].labels[0].confidence.toString()}');

  //       textFood.value = objects[0].labels[0].text;
  //       textCal.value = objects[0].labels[0].confidence.toString();
  //     }
  //   }

  //   _isBusy.value = false;

  //   update();
  // }

  // Future<String> getModel(String assetPath) async {
  //   if (io.Platform.isAndroid) {
  //     return 'flutter_assets/$assetPath';
  //   }
  //   final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
  //   await io.Directory(dirname(path)).create(recursive: true);
  //   final file = io.File(path);
  //   if (!await file.exists()) {
  //     final byteData = await rootBundle.load(assetPath);
  //     await file.writeAsBytes(byteData.buffer
  //         .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  //   }
  //   return file.path;
  // }

  /////
  // Future loadModel() async {
  //   Tflite.close();
  //   String? result;
  //   result = await Tflite.loadModel(
  //     model: 'assets/ml/food_v2.tflite',
  //     labels: 'assets/ml/labels.txt',
  //     useGpuDelegate: true,
  //   );
  //   debugPrint('loadModel : $result');
  // }

  // initCamera() async {
  //   if (cameras.any(
  //     (element) =>
  //         element.lensDirection == CameraLensDirection.back &&
  //         element.sensorOrientation == 90,
  //   )) {
  //     cameraIndex = cameras.indexOf(
  //       cameras.firstWhere(
  //         (element) =>
  //             element.lensDirection == CameraLensDirection.back &&
  //             element.sensorOrientation == 90,
  //       ),
  //     );
  //   } else {
  //     for (var i = 0; i < cameras.length; i++) {
  //       if (cameras[i].lensDirection == CameraLensDirection.back) {
  //         cameraIndex = i;
  //         break;
  //       }
  //     }
  //   }

  //   cameraController = CameraController(
  //     cameras[cameraIndex],
  //     ResolutionPreset.medium,
  //     enableAudio: false,
  //   );
  //   cameraController!.initialize().then((value) {
  //     cameraController!.startImageStream(detectObject);
  //   });
  // }

  // detectObject(CameraImage image) async {
  //   textFood.value = 'Scanning...';
  //   textCal.value = 'Scanning...';

  //   final WriteBuffer allBytes = WriteBuffer();
  //   for (final Plane plane in image.planes) {
  //     allBytes.putUint8List(plane.bytes);
  //   }

  //   final camera = cameras![cameraIndex];
  //   final imageRotation =
  //       InputImageRotationValue.fromRawValue(camera.sensorOrientation);
  //   if (imageRotation == null) return;

  //   final inputImageFormat =
  //       InputImageFormatValue.fromRawValue(image.format.raw);
  //   if (inputImageFormat == null) return;

  //   var detectedObjects = await Tflite.detectObjectOnFrame(
  //     bytesList: image.planes.map((plane) {
  //       return plane.bytes;
  //     }).toList(),
  //     imageHeight: image.height,
  //     imageWidth: image.width,
  //     threshold: 0.2,
  //   );

  //   if (detectedObjects != null) {
  //     debugPrint(
  //         'detectedObject : ${detectedObjects[0]['detectedClass']} confidence : ${detectedObjects[0]['confidenceInClass']}');

  //     if (detectedObjects[0]['confidenceInClass'] > 0.5) {
  //       textFood.value = detectedObjects[0]['detectedClass'];
  //       textCal.value = detectedObjects[0]['confidenceInClass'];
  //     }
  //   }
  // }
}
