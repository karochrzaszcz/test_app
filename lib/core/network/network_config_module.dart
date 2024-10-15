import 'package:injectable/injectable.dart';
import 'package:test_app/core/app_config/app_config.dart';
import 'package:test_app/core/di/named_parameters.dart';
import 'package:test_app/infrastructure/network/client/api_client.dart';

@module
abstract class NetworkConfigModule {
  @lazySingleton
  ApiClient get apiClient;

  @singleton
  @Named(NamedParameters.apiBaseUrl)
  String apiBaseUrl(AppConfig appConfig) {
    return appConfig.apiUrl;
  }
}
