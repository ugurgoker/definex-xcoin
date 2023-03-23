import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/services.dart';

import '../enums/enum.dart';
import '../models/model_dropdown.dart';
import '../resources/_r.dart';
import '../utils/general_data.dart';

class LanguageController {
  static AppLanguage currentAppLang = AppLanguage.en;

  static ModelDropdown tr = ModelDropdown(id: AppLanguage.tr.id, title: 'Türkçe');
  static ModelDropdown en = ModelDropdown(id: AppLanguage.en.id, title: 'İngilizce');

  static late Locale currentLocale;
  static late Map<String, dynamic> selectedLocaleJson;

  static const String translationsPath = 'assets/translations';
  static const List<Locale> supportedLocales = [Locale('en', 'US'), Locale('tr', 'TR')];

  static Future<void> setLanguage(AppLanguage language) async {
    if (GeneralData.getInstance().getLanguage() != language) {
      currentAppLang = language;
      GeneralData.getInstance().setLanguage(language);
      await initialize();
    }
    R.refreshClass();

    log('current language: ${currentLocale.toLanguageTag()}', name: 'LOCALIZATION');
  }

  static Future<void> initialize() async {
    switch (GeneralData.getInstance().getLanguage()) {
      case AppLanguage.en:
        currentLocale = supportedLocales[0];
        currentAppLang = AppLanguage.en;
        await loadLang();
        break;
      case AppLanguage.tr:
        currentLocale = supportedLocales[1];
        currentAppLang = AppLanguage.tr;
        await loadLang();
        break;
      default:
        var deviceLocale = Locale(Platform.localeName.substring(0, 2));
        int localeIndex = supportedLocales.indexWhere((element) => element.languageCode == deviceLocale.languageCode);
        if (localeIndex == -1) {
          currentLocale = supportedLocales[0];
          currentAppLang = AppLanguage.en;
          await loadLang();
          break;
        }
        currentLocale = supportedLocales[localeIndex];
        currentAppLang = AppLanguage.locale;
        await loadLang();
        break;
    }

    log('current language: ${currentLocale.toLanguageTag()}', name: 'LOCALIZATION');
  }

  static Future<void> loadLang() async {
    selectedLocaleJson = jsonDecode(await rootBundle.loadString('$translationsPath/${currentLocale.toLanguageTag()}.json'));
    en = ModelDropdown(id: AppLanguage.en.id, title: R.string.english);
    tr = ModelDropdown(id: AppLanguage.tr.id, title: R.string.turkish);
  }

  static String getLanguageName() {
    switch (GeneralData.getInstance().getLanguage()) {
      case AppLanguage.tr:
        return R.string.turkish;
      case AppLanguage.en:
        return R.string.english;
      default:
        return R.string.turkish;
    }
  }

  static List<ModelDropdown> getLanguagesForDropdown() {
    return [tr, en];
  }
}
