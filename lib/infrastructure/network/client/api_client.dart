import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/di/named_parameters.dart';
import 'package:test_app/core/network/converter/json_to_type_converter.dart';
import 'package:test_app/infrastructure/network/client/interceptor/authorization_interceptor.dart';

base class ApiClient extends ChopperClient {
  ApiClient(
    @Named(NamedParameters.apiBaseUrl) String apiUrl,
    AuthorizationInterceptor authorizationInterceptor,
    JsonToTypeConverter converter,
  ) : super(
          baseUrl: Uri.parse(apiUrl),
          interceptors: [
            authorizationInterceptor,
          ],
          converter: converter,
          errorConverter: converter,
        );
}
