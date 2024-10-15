import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency.f.freezed.dart';
part 'currency.f.g.dart';

@freezed
class Currency with _$Currency {
  const factory Currency({
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
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}
