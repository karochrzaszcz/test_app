import 'package:test_app/core/app_config/app_env.dart';

class AppConfig {
  const AppConfig._({
    required this.environment,
  });

  factory AppConfig.beta() {
    return const AppConfig._(
      environment: AppEnv.beta,
    );
  }

  final String environment;

  final String apiKey = const String.fromEnvironment('API_KEY');
  final String apiUrl = const String.fromEnvironment('API_URL');
}
