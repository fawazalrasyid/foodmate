import 'package:get/get.dart';

import '../controllers/form_pick_up_controller.dart';

class FormPickUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormPickUpController>(
      () => FormPickUpController(),
    );
  }
}
