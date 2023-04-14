import 'package:get/get.dart';

import '../controllers/scan_result_controller.dart';

class ScanResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanResultController>(
      () => ScanResultController(),
    );
  }
}
