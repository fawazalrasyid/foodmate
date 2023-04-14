import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../core/values/app_colors.dart';
import '../../food/views/food_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../program/views/program_view.dart';
import '../../scan/views/scan_view.dart';

class MainController extends GetxController {
  PersistentTabController tabCtrl = PersistentTabController(initialIndex: 0);

  var tabIndex = 0.obs;

  List<Widget> pageItems() {
    return [
      HomeView(),
      const ProgramView(),
      ScanView(),
      const FoodView(),
      ProfileView()
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyLight.home),
        title: ("Home"),
        activeColorPrimary: AppColors.selectedNavbarIconColor,
        inactiveColorPrimary: AppColors.navbarIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.trade),
        title: ("Program"),
        activeColorPrimary: AppColors.selectedNavbarIconColor,
        inactiveColorPrimary: AppColors.navbarIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyLight.scan),
        title: ("Scan"),
        activeColorPrimary: AppColors.selectedNavbarIconColor,
        activeColorSecondary: AppColors.white,
        inactiveColorPrimary: AppColors.navbarIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.activity),
        title: ("Food"),
        activeColorPrimary: AppColors.selectedNavbarIconColor,
        inactiveColorPrimary: AppColors.navbarIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.profile_circle),
        title: ("Profile"),
        activeColorPrimary: AppColors.selectedNavbarIconColor,
        inactiveColorPrimary: AppColors.navbarIconColor,
      ),
    ];
  }
}
