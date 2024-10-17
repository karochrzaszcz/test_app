import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_app/presentation/i18n/locale_keys.g.dart';
import 'package:test_app/presentation/router/app_router.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr(LocaleKeys.start_title)),
      ),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () => const CurrencyRoute().go(context),
            child: Text(tr(LocaleKeys.start_all_currencies_cta)),
          ),
        ],
      ),
    );
  }
}
