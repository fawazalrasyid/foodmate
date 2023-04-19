import 'package:get/get.dart';

import '../controllers/journal_history_controller.dart';

class JournalHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JournalHistoryController>(
      () => JournalHistoryController(),
    );
  }
}
