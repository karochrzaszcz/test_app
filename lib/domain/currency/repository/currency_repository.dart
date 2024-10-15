import 'package:test_app/domain/currency/enum/currency_type.dart';
import 'package:test_app/domain/currency/model/currency.f.dart';

abstract class CurrencyRepository {
  Future<List<Currency>> getCurrencies(CurrencyType type);
}
