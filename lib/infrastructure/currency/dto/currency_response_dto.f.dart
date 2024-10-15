import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app/infrastructure/core/meta_dto.f.dart';
import 'package:test_app/infrastructure/currency/dto/currency_dto.f.dart';

part 'currency_response_dto.f.freezed.dart';
part 'currency_response_dto.f.g.dart';

@freezed
class CurrencyResponseDto with _$CurrencyResponseDto {
  const factory CurrencyResponseDto({
    required MetaDto meta,
    required List<CurrencyDto> response,
  }) = _CurrencyResponseDto;

  factory CurrencyResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CurrencyResponseDtoFromJson(json);
}
