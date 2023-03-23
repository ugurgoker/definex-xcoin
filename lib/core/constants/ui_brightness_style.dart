import 'package:flutter/services.dart';
import '/core/resources/_r.dart';

class UIBrightnessStyle {
  SystemUiOverlayStyle dark({Color? statusBarColor, Brightness? statusBarBrightness, Color? systemNavigationBarColor, Brightness? systemNavigationBarBrightness}) => SystemUiOverlayStyle(
    systemNavigationBarColor: systemNavigationBarColor ?? R.color.transparent,
    statusBarColor: statusBarColor ?? R.color.transparent,
    statusBarIconBrightness: statusBarBrightness ?? Brightness.dark,
    systemNavigationBarIconBrightness: systemNavigationBarBrightness ?? Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
  SystemUiOverlayStyle light({Color? statusBarColor, Brightness? statusBarBrightness, Color? systemNavigationBarColor, Brightness? systemNavigationBarBrightness}) => SystemUiOverlayStyle(
    systemNavigationBarColor: systemNavigationBarColor ?? R.color.transparent,
    statusBarColor: statusBarColor ?? R.color.transparent,
    statusBarIconBrightness: statusBarBrightness ?? Brightness.light,
    systemNavigationBarIconBrightness: systemNavigationBarBrightness ?? Brightness.light,
    statusBarBrightness: Brightness.dark,
  );
}