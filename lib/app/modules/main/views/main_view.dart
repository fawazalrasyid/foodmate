import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../core/values/app_colors.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);
  @override
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return PersistentTabView(
          context,
          controller: controller.tabCtrl,
          screens: controller.pageItems(),
          items: controller.navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: AppColors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(0),
            colorBehindNavBar: AppColors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style15,
        );
      },
    );
  }
}
