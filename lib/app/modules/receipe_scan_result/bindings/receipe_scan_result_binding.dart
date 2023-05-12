import 'package:get/get.dart';

import '../controllers/receipe_scan_result_controller.dart';

class ReceipeScanResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceipeScanResultController>(
      () => ReceipeScanResultController(),
    );
  }
}
