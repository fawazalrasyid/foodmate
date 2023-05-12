import 'package:get/get.dart';

import '../controllers/detail_receipe_controller.dart';

class DetailReceipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailReceipeController>(
      () => DetailReceipeController(),
    );
  }
}
