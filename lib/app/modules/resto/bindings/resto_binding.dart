import 'package:get/get.dart';

import '../controllers/resto_controller.dart';

class RestoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestoController>(
      () => RestoController(),
    );
  }
}
