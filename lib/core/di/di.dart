import 'package:injectable/injectable.dart';
import 'package:test_app/core/di/di.config.dart';
import 'package:test_app/core/di/service_locator.dart';

@InjectableInit()
Future<void> configureDependencies(String env) async =>
    sl.init(environment: env);
