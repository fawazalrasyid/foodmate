import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/program_controller.dart';

class ProgramView extends GetView<ProgramController> {
  const ProgramView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgramView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProgramView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
