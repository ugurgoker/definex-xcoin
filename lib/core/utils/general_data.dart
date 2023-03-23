import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../enums/enum.dart';
import 'utilities.dart';

class GeneralData {
  static GeneralData? _instance;
  static GeneralData getInstance() => _instance ??= GeneralData();

  static NumberFormat currencyFormat = NumberFormat('#,##0.00');

  final String _spDARKMODE = 'dark_mode';
  final String _spLANGUAGE = 'language';


  late Box<dynamic> hive;

  ThemeApperance getDarkMode() => ThemeApperance.values[Utilities.getUserSp(_spDARKMODE, defaultValue: ThemeApperance.dark.index)];
  void setDarkMode(ThemeApperance value) async => Utilities.setUserSp(_spDARKMODE, value.index);

  AppLanguage getLanguage() => AppLanguage.fromId(Utilities.getUserSp(_spLANGUAGE, defaultValue: AppLanguage.locale.id));
  void setLanguage(AppLanguage value) async => Utilities.setUserSp(_spLANGUAGE, value.id);

  
}
