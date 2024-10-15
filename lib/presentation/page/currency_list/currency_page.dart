import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:test_app/domain/currency/enum/currency_type.dart';
import 'package:test_app/presentation/basic_content/loading_content.dart';
import 'package:test_app/presentation/basic_content/no_data_content.dart';
import 'package:test_app/presentation/basic_widget/vertical_spacer.dart';
import 'package:test_app/presentation/i18n/locale_keys.g.dart';
import 'package:test_app/presentation/page/currency_list/cubit/currency_cubit.dart';
import 'package:test_app/presentation/page/currency_list/cubit/currency_state.f.dart';
import 'package:test_app/presentation/router/app_router.dart';
import 'package:test_app/presentation/style/app_spacings.dart';

class CurrencyPage extends HookWidget {
  const CurrencyPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<CurrencyCubit>();
    final state = useBlocBuilder(cubit);

    useEffect(
      () {
        cubit.loadData(type: CurrencyType.all);
        return null;
      },
      [cubit],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(tr(LocaleKeys.currency_title)),
      ),
      body: switch (state) {
        LoadingState() => const LoadingContent(),
        EmptyState() => NoDataContent(
            title: tr(LocaleKeys.currency_no_data),
          ),
        IdleState() => CustomScrollView(
            slivers: [
              SliverList.separated(
                itemBuilder: (context, index) {
                  final currency = state.currencies[index];

                  return ListTile(
                    title: Text(currency.name),
                    onTap: () => CurrencyDetailRoute(
                      currency,
                      id: currency.code,
                    ).go(context),
                  );
                },
                itemCount: state.currencies.length,
                separatorBuilder: (_, __) => const VerticalSpacer(
                  height: AppSpacings.eight,
                ),
              ),
            ],
          ),
      },
    );
  }
}
