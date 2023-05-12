import 'package:get/get.dart';

import '../controllers/receipe_scan_controller.dart';

class ReceipeScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceipeScanController>(
      () => ReceipeScanController(),
    );
  }
}
