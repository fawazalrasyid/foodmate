import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color pageBackground = Color(0xFFF8FAFF);
  static const Color statusBarColor = Color(0xFF38686A);
  static const Color appBarColor = Color(0xFF38686A);
  static const Color appBarIconColor = Color(0xFFFFFFFF);
  static const Color appBarTextColor = Color(0xFFFFFFFF);

  static const Color centerTextColor = Colors.grey;
  static const MaterialColor colorPrimarySwatch = Colors.green;
  static const Color colorPrimary = Color(0xff4DB236);
  static const Color colorAccent = Color(0xffFE860A);
  Color successColor = const Color(0xff6CCC77);
  static const Color errorColor = Color(0xffFF5070);
  static const Color warningColor = Color(0xffFDAC71);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color darkGrey = Color(0xFF25293C);
  static const Color dark = Color(0xFF323232);
  static const Color lightGrey = Color(0xFFC4C4C4);
  static const Color lightGreen = Color(0xFF00EFA7);

  static const Color textPrimaryColor = colorPrimary;
  static const Color textTitleColor = Color(0xff071630);
  static const Color textSubtitleColor = Color(0xff464646);
  static const Color textBodyColor = Color(0xff82838A);
  static const Color textSecondaryColor = Color(0xffC6C7CF);
  static const Color textDisabledColor = Color(0xffEFEFEF);
  static const Color textColorTag = colorPrimary;
  static const Color textColorGreyLight = Color(0xFFABABAB);
  static const Color textColorGreyDark = Color(0xFF979797);
  static const Color textColorBlueGreyDark = Color(0xFF939699);
  static const Color textColorCyan = Color(0xFF38686A);
  static const Color textColorWhite = Color(0xFFFFFFFF);
  static Color searchFieldTextColor = const Color(0xFF323232).withOpacity(0.5);

  static const Color buttonBgColor = colorPrimary;
  static const Color buttonGreyColor = Color(0xFFF4F6FB);
  static const Color disabledButtonBgColor = Color(0xFFE7EAF2);
  static const Color defaultRippleColor = Color(0x0338686A);

  static const Color textFieldBorderColor = Color(0xFFBFBFC0);
  static const Color focusedTextFieldBorderColor = colorPrimary;
  static const Color hintColor = Color(0xffC6C6C6);

  static const Color iconrColor = Color(0xFFD8DCDF);
  static const Color selectedIconColor = colorPrimary;

  static const Color tabBarColor = Color(0xFF98ACD1);
  static const Color selectedTabBarColor = Color(0xffff6e49);

  static const Color navbarIconColor = Color(0xFFD8DCDF);
  static const Color selectedNavbarIconColor = colorPrimary;
  static const Color navbarBackgroundColor = Color(0xFFFFFFFF);

  static const Color iconColorDefault = Color(0xFF82838A);

  static Color barrierColor = const Color(0xFF000000).withOpacity(0.5);

  static Color timelineDividerColor = const Color(0x5438686A);

  static const Color gradientStartColor = Colors.black87;
  static const Color gradientEndColor = Colors.transparent;
  static const Color silverAppBarOverlayColor = Color(0x80323232);

  static const Color switchActiveColor = colorPrimary;
  static const Color switchInactiveColor = Color(0xFFABABAB);
  static Color elevatedContainerColorOpacity = Colors.grey.withOpacity(0.5);
  static const Color suffixImageColor = Colors.grey;
}
