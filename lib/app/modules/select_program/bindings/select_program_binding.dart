import 'package:get/get.dart';

import '../controllers/select_program_controller.dart';

class SelectProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectProgramController>(
      () => SelectProgramController(),
    );
  }
}
