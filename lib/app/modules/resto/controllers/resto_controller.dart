import 'package:get/get.dart';

import '../../../core/configs/constants.dart';
import '../../../data/model/resto_recommendation_response_model.dart';

class RestoController extends GetxController {
  late var argumentData;
  final Rxn<List<Result>> resto = Rxn<List<Result>>();

  @override
  void onInit() {
    getRestoRecommendation();
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

  getRestoRecommendation() async {
    argumentData = Get.arguments;
    resto.value = argumentData[0]['resto'];
  }

  getRestoPhoto(String? ref) {
    final url =
        "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$ref&sensor=false&key=${Constants.mapsApiKey}";

    return url;
  }
}
