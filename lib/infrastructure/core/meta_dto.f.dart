import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_dto.f.g.dart';
part 'meta_dto.f.freezed.dart';

@freezed
class MetaDto with _$MetaDto {
  const factory MetaDto({
    required int code,
    required String disclaimer,
  }) = _MetaDto;

  factory MetaDto.fromJson(Map<String, dynamic> json) =>
      _$MetaDtoFromJson(json);
}
