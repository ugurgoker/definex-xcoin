import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/enums/enum.dart';
import 'core/resources/_r.dart';
import 'core/services/service_json_mapper_context.dart';
import 'core/settings/controller_language.dart';
import 'core/utils/general_data.dart';
import 'main.dart';
import 'main.reflectable.dart';

Future<void> main() async {
  FlavorConfig(
    name: Flavor.dev.value,
    color: R.color.primary,
    location: BannerLocation.topEnd,
    variables: {
      'baseUrl': 'https://xcoin-70afa.web.app/api/',
      'fileUrl': 'https://xcoin-70afa.web.app/',
    },
  );

  initializeReflectable();
  ServiceJsonMapperContext();

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  GeneralData.getInstance().hive = await Hive.openBox('xcoin_dev');

  await LanguageController.initialize();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: R.color.transparent),
  );

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
  );

  runApp(const FlavorBanner(child: XCoinApp()));
}