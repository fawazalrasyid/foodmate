import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/journal_history_controller.dart';

class JournalHistoryView extends GetView<JournalHistoryController> {
  const JournalHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JournalHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'JournalHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
