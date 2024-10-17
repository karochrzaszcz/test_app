import 'package:injectable/injectable.dart';
import 'package:test_app/domain/currency/repository/currency_repository.dart';
import 'package:test_app/presentation/cubit/safe_cubit.dart';
import 'package:test_app/presentation/page/currency_list/cubit/currency_state.f.dart';

@injectable
class CurrencyCubit extends SafeCubit<CurrencyState> {
  CurrencyCubit(
    this.currencyRepository,
  ) : super(const CurrencyState.loading());

  final CurrencyRepository currencyRepository;

  Future<void> loadData() async {
    final currencies = await currencyRepository.getCurrencies();
    currencies.isEmpty
        ? emit(const CurrencyState.empty())
        : emit(CurrencyState.idle(currencies: currencies));
  }
}
