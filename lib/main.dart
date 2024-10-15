import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/core/app_config/app_config.dart';
import 'package:test_app/core/di/di.dart';
import 'package:test_app/presentation/app.dart';
import 'package:test_app/presentation/i18n/app_locale.dart';

void runMain(AppConfig appConfig) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();

      try {
        await configureDependencies(appConfig.environment);
      } on Exception catch (ex) {
        // TODO: Log error
        // print('Error while configureDependencies: $ex');
      }

      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      runApp(
        EasyLocalization(
            fallbackLocale: AppLocale.pl,
            startLocale: AppLocale.pl,
            saveLocale: false,
            useFallbackTranslations: true,
            supportedLocales: const [
              AppLocale.pl,
              AppLocale.en,
            ],
            path: 'assets/translations',
            child: const MainApp()),
      );
    },
    (ex, _) async {
      // TODO: Log error
      // print('Unhandled exception during runZoned: $ex');
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
