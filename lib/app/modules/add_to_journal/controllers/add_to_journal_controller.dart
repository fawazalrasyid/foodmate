import 'package:camera/camera.dart';
import 'package:get/get.dart';

import '../../../data/model/predict_object_model.dart';

class AddToJournalController extends GetxController {
  late var argumentData;
  late Rx<XFile?> objectImage = Rx<XFile?>(null);
  late PredictObjectResponseModel foodData;

  late final int weight;

  final calorie = 0.obs;
  final protein = 0.obs;
  final carbohydrates = 0.obs;
  final fat = 0.obs;

  @override
  void onInit() {
    getData();
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

  void getData() {
    // get arguments from prev page
    argumentData = Get.arguments;
    objectImage = argumentData[0]['image'];
    foodData = argumentData[1]['foodData'];
    weight = argumentData[2]['weight'];

    calculateNutritions();
  }

  void calculateNutritions() {
    var fd = foodData.data!;

    var servingSize = fd.servingSize!;

    calorie.value = ((fd.calories!.value! / servingSize) * weight).toInt();
    protein.value = ((fd.protein!.value! / servingSize) * weight).toInt();
    carbohydrates.value =
        ((fd.carbohydrates!.value! / servingSize) * weight).toInt();
    fat.value = ((fd.fat!.value! / servingSize) * weight).toInt();
  }
}
