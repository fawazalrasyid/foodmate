import 'package:get/get.dart';

import '../controllers/pick_up_map_controller.dart';

class PickUpMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickUpMapController>(
      () => PickUpMapController(),
    );
  }
}
