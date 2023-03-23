import 'package:flutter/material.dart';

import '../enums/enum.dart';
import '../settings/controller_theme.dart';
import '_r.dart';

class AppColor {
  final Color transparent = const Color(0x00000000);
  final Color white = const Color(0xFFFFFFFF);
  final Color black = const Color(0xFF000000);

  final Color grayLight = const Color(0xFF999999);
  final Color grayLightBlue = const Color(0xFFDAE2E9);

  final Color borderBottomNav = const Color(0xFFD5E1E2);
  final Color viewBg = const Color(0xFFF8F9FA);
  final Color price = const Color(0xFF2C2B32);
  final Color actionSheetTitle = const Color(0xFFEBEBF5);

  final Color bottomSheetRadiusColor = const Color(0xFF858585);
  final Color logoTextColor = const Color(0xFF343A40);
  final Color titleColor = const Color(0xFF212529);

  final Color radicalRed = const Color(0xFFD90429);
  final Color green = const Color(0xFF21BF73);

  final Color grayDark = const Color(0xFF6C757D);
  final Color borderColor = const Color(0xFFDFE2E4);

  final MaterialColor primary = const MaterialColor(0xFF0063F5, {
    25: Color(0xFF0063F5),
    50: Color(0xFF0063F5),
    100: Color(0xFF0063F5),
    200: Color(0xFF0063F5),
    300: Color(0xFF0063F5),
    400: Color(0xFF0063F5),
    500: Color(0xFF0063F5),
    600: Color(0xFF0063F5),
    700: Color(0xFF0063F5),
    800: Color(0xFF0063F5),
    900: Color(0xFF0063F5),
  });

  final MaterialColor gray = const MaterialColor(0xFF475467, {
    25: Color(0xFFFCFCFD),
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF2F4F7),
    200: Color(0xFFEAECF0),
    300: Color(0xFFD0D5DD),
    400: Color(0xFF98A2B3),
    500: Color(0xFF667085),
    600: Color(0xFF475467),
    700: Color(0xFF344054),
    800: Color(0xFF1D2939),
    900: Color(0xFF101828),
  });

  final MaterialColor error = const MaterialColor(0xFFD92D20, {
    25: Color(0xFFFFFBFA),
    50: Color(0xFFFEF3F2),
    100: Color(0xFFFEE4E2),
    200: Color(0xFFFECDCA),
    300: Color(0xFFFDA29B),
    400: Color(0xFFF97066),
    500: Color(0xFFF04438),
    600: Color(0xFFD92D20),
    700: Color(0xFFB42318),
    800: Color(0xFF912018),
    900: Color(0xFF7A271A),
  });

  final MaterialColor warning = const MaterialColor(0xFFDC6803, {
    25: Color(0xFFFFFCF5),
    50: Color(0xFFFFFAEB),
    100: Color(0xFFFEF0C7),
    200: Color(0xFFFEDF89),
    300: Color(0xFFFEC84B),
    400: Color(0xFFFDB022),
    500: Color(0xFFF79009),
    600: Color(0xFFDC6803),
    700: Color(0xFFB54708),
    800: Color(0xFF93370D),
    900: Color(0xFF7A2E0E),
  });

  final MaterialColor success = const MaterialColor(0xFF039855, {
    25: Color(0xFFF6FEF9),
    50: Color(0xFFECFDF3),
    100: Color(0xFFD1FADF),
    200: Color(0xFFA6F4C5),
    300: Color(0xFF6CE9A6),
    400: Color(0xFF32D583),
    500: Color(0xFF12B76A),
    600: Color(0xFF039855),
    700: Color(0xFF027A48),
    800: Color(0xFF05603A),
    900: Color(0xFF054F31),
  });
}

class AppThemeColor {
  final Color viewBg = _ThemeColor(dark: R.color.white, light: R.color.black).theme;
}

class _ThemeColor {
  Color light;
  Color dark;

  Color get theme {
    switch (ThemeController.getInstance().currentAppTheme) {
      case ThemeApperance.light:
        return light;
      case ThemeApperance.dark:
        return dark;
      default:
        return light;
    }
  }

  _ThemeColor({required this.dark, required this.light});
}
