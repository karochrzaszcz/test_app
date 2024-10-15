import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:test_app/core/di/service_locator.dart';
import 'package:test_app/presentation/basic_widget/empty.dart';
import 'package:test_app/presentation/router/app_router.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HookedBlocConfigProvider(
      // ignore: implicit_call_tearoffs
      injector: () => sl,
      child: AppWithRouter(
        sl.get<AppRouter>(),
      ),
    );
  }
}

class AppWithRouter extends HookWidget {
  const AppWithRouter(
    this._appRouter, {
    super.key,
  });

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => child ?? const Empty(),
      title: 'TestApp',
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
