import 'package:chopper/chopper.dart';

extension RequestExtension on Request {
  Request addParams(Map<String, dynamic> params) {
    final requestParams = Map<String, dynamic>.from(parameters);
    requestParams.addAll(params);

    return copyWith(parameters: requestParams);
  }
}
