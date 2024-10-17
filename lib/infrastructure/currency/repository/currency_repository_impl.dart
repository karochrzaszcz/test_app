import 'package:injectable/injectable.dart';
import 'package:test_app/domain/currency/model/currency.f.dart';
import 'package:test_app/domain/currency/repository/currency_repository.dart';
import 'package:test_app/infrastructure/currency/data_source/currency_data_source.dart';
import 'package:test_app/infrastructure/currency/mapper/currency_mapper.dart';

@LazySingleton(as: CurrencyRepository)
class CurrencyRepositoryImpl implements CurrencyRepository {
  const CurrencyRepositoryImpl(
    this.dataSource,
    this.currencyMapper,
  );

  final CurrencyDataSource dataSource;
  final CurrencyMapper currencyMapper;

  @override
  Future<List<Currency>> getCurrencies() async {
    final response = await dataSource.getCurrencyList();
    if (response.isSuccessful) {
      return response.body?.response
              .map((dto) => currencyMapper.fromDto(dto))
              .toList() ??
          [];
    } else {
      // TODO: Handle error
      return [];
    }
  }
}
