import 'package:injectable/injectable.dart';
import 'package:test_app/core/app_config/app_config.dart';
import 'package:test_app/core/app_config/app_env.dart';

@module
abstract class AppConfigModule {
  @beta
  @lazySingleton
  AppConfig get appConfig => AppConfig.beta();
}
