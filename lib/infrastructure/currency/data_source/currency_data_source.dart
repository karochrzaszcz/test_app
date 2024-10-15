import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/infrastructure/currency/dto/currency_response_dto.f.dart';
import 'package:test_app/infrastructure/network/client/api_client.dart';

part 'currency_data_source.chopper.dart';

@lazySingleton
@ChopperApi()
abstract class CurrencyDataSource extends ChopperService {
  @factoryMethod
  static CurrencyDataSource create(ApiClient client) =>
      _$CurrencyDataSource(client);

  @Get(path: '/v1/currencies')
  Future<Response<CurrencyResponseDto>> getCurrencyList({
    @Query('type') required String type,
  });
}
