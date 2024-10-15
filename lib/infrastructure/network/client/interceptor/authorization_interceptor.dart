import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/app_config/app_config.dart';
import 'package:test_app/core/di/service_locator.dart';
import 'package:test_app/infrastructure/network/extension/request_extension.dart';

@injectable
class AuthorizationInterceptor implements Interceptor {
  const AuthorizationInterceptor();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final apiKey = sl.get<AppConfig>().apiKey;
    final request = chain.request.addParams({'api_key': apiKey});

    final result = await chain.proceed(request);
    return result;
  }
}
