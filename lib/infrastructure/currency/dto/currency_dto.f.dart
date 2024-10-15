import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_dto.f.freezed.dart';
part 'currency_dto.f.g.dart';

@freezed
class CurrencyDto with _$CurrencyDto {
  const factory CurrencyDto({
    required int id,
    required String name,
    required String code,
    required int precision,
    required int subunit,
    required String symbol,
    bool? symbolFirst,
    String? decimalMark,
    String? thousandsSeparator,
    String? shortCode,
  }) = _CurrencyDto;

  factory CurrencyDto.fromJson(Map<String, dynamic> json) =>
      _$CurrencyDtoFromJson(json);
}
