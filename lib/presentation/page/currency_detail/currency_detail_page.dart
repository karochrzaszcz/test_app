import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_app/domain/currency/model/currency.f.dart';
import 'package:test_app/presentation/i18n/locale_keys.g.dart';

class CurrencyDetailPage extends StatelessWidget {
  const CurrencyDetailPage({
    required this.currency,
    super.key,
  });

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr(LocaleKeys.currency_detail_title)),
      ),
      body: Text(
        currency.toString(),
      ),
    );
  }
}
