import 'package:injectable/injectable.dart';
import 'package:test_app/domain/currency/model/currency.f.dart';
import 'package:test_app/domain/mapper/mapper.dart';
import 'package:test_app/infrastructure/currency/dto/currency_dto.f.dart';

@injectable
class CurrencyMapper extends Mapper<Currency, CurrencyDto> {
  const CurrencyMapper();

  @override
  Currency fromDto(CurrencyDto dto) {
    return Currency(
      id: dto.id,
      name: dto.name,
      shortCode: dto.shortCode,
      code: dto.code,
      precision: dto.precision,
      subunit: dto.subunit,
      symbol: dto.symbol,
      symbolFirst: dto.symbolFirst,
      decimalMark: dto.decimalMark,
      thousandsSeparator: dto.thousandsSeparator,
    );
  }
}
