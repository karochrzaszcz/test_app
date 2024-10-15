import 'package:injectable/injectable.dart';
import 'package:test_app/infrastructure/currency/dto/currency_response_dto.f.dart';

@module
abstract class ModelToJsonConfig {
  @lazySingleton
  Map<Type, Function> get instance => {
        CurrencyResponseDto: CurrencyResponseDto.fromJson,
      };
}
