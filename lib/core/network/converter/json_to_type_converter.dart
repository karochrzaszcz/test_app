import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';

@injectable
class JsonToTypeConverter extends JsonConverter {
  const JsonToTypeConverter(this.modelToJsonConfig);

  final Map<Type, Function> modelToJsonConfig;

  Type _getType<T>() => T;

  @override
  FutureOr<Response<dynamic>> convertError<BodyType, InnerType>(
    Response<dynamic> response,
  ) {
    final responseWithBody = response.copyWith(
      body: response.body ?? '',
    );
    return super.convertError<BodyType, InnerType>(responseWithBody);
  }

  @override
  Response<T> convertResponse<T, InnerType>(Response<dynamic> response) {
    final voidType = _getType<void>();
    if (T == voidType) {
      return response.copyWith(body: null);
    }
    if (response.bodyString.isEmpty) {
      return Response(
        response.base,
        null as T?,
        error: response.error,
      );
    }

    late dynamic jsonMap;

    jsonMap = json.decode(response.bodyString);

    if (jsonMap is Iterable) {
      final body = jsonMap
          .map((item) => _decodeMap<InnerType>(item as Map<String, dynamic>))
          .toList() as T;
      return response.copyWith(body: body);
    } else if (jsonMap is Map<String, dynamic>) {
      final body = _decodeMap<InnerType>(jsonMap) as T;
      return response.copyWith(body: body);
    } else if (jsonMap is T) {
      return response.copyWith(body: jsonMap);
    }
    throw UnimplementedError(
      'Got $jsonMap of type ${jsonMap.runtimeType} but expected Iterable or Map<String,dynamic>',
    );
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final parser = modelToJsonConfig[T] as T Function(
      Map<String, dynamic>,
    )?;
    if (parser == null) {
      throw UnimplementedError(
        'Not implemented parser for: ${T.toString()}',
      );
    }
    return parser(values);
  }
}
