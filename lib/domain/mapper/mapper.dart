import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class Mapper<Domain, Dto> {
  const Mapper();

  FutureOr<Domain> fromDto(Dto dto) {
    throw UnimplementedError();
  }

  FutureOr<Dto> toDto(Domain domain) {
    throw UnimplementedError();
  }
}
