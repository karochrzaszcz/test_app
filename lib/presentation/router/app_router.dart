import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/domain/currency/model/currency.f.dart';
import 'package:test_app/presentation/page/currency_detail/currency_detail_page.dart';
import 'package:test_app/presentation/page/currency_list/currency_page.dart';
import 'package:test_app/presentation/page/start/start_page.dart';
import 'package:test_app/presentation/router/routes.dart';

part 'app_router.g.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>();

@lazySingleton
class AppRouter {
  GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigationKey,
    routes: $appRoutes,
  );
}

@TypedGoRoute<StartRoute>(
  path: StartPath.root,
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<CurrencyRoute>(
        path: CurrencyPath.root,
        routes: <TypedGoRoute<CurrencyDetailRoute>>[
          TypedGoRoute<CurrencyDetailRoute>(
            path: CurrencyPath.details,
          ),
        ]),
  ],
)
class StartRoute extends GoRouteData {
  const StartRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const StartPage();
}

class CurrencyRoute extends GoRouteData {
  const CurrencyRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CurrencyPage();
}

class CurrencyDetailRoute extends GoRouteData {
  const CurrencyDetailRoute(
    this.$extra, {
    required this.id,
  });

  final String id;
  final Currency $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) => CurrencyDetailPage(
        currency: $extra,
      );
}
