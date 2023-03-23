import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/enums/enum.dart';
import 'core/resources/_r.dart';
import 'core/services/service_json_mapper_context.dart';
import 'core/settings/controller_language.dart';
import 'core/utils/general_data.dart';
import 'main.reflectable.dart';
import 'provider_setup.dart';
import 'ui/base/base_view.dart';

Future<void> main() async {
  FlavorConfig(
    name: Flavor.prod.value,
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
  GeneralData.getInstance().hive = await Hive.openBox('xcoin');

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

  runApp(const XCoinApp());
}

class XCoinApp extends StatelessWidget with BaseView {
  const XCoinApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Builder(builder: (context) {
        return MaterialApp.router(
          theme: ThemeData(
            fontFamily: R.fonts.robotoRegular,
            primarySwatch: R.color.primary,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          supportedLocales: LanguageController.supportedLocales,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routerDelegate: router(context).routerDelegate,
          routeInformationProvider: router(context).rootRouter.routeInfoProvider(),
          routeInformationParser: router(context).rootRouter.defaultRouteParser(),
          builder: (_, router) => router!,
        );
      }),
    );
  }
}
