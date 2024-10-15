import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app/domain/currency/model/currency.f.dart';

part 'currency_state.f.freezed.dart';

@freezed
sealed class CurrencyState with _$CurrencyState {
  const factory CurrencyState.loading() = LoadingState;
  const factory CurrencyState.idle({
    required List<Currency> currencies,
  }) = IdleState;
  const factory CurrencyState.empty() = EmptyState;
}
