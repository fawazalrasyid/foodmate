import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../controllers/quests_controller.dart';

class QuestsView extends GetView<QuestsController> {
  const QuestsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            IconlyLight.arrow_left_2,
            color: Color(0xffffffff),
          ),
          splashRadius: 28,
        ),
        centerTitle: true,
        title: const Text(
          "Quest",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Image.asset(
          "assets/images/quest.png",
          width: Get.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
