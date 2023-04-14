import 'package:get/get.dart';

import '../controllers/add_to_journal_controller.dart';

class AddToJournalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddToJournalController>(
      () => AddToJournalController(),
    );
  }
}
