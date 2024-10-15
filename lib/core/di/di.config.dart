// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:test_app/core/app_config/app_config.dart' as _i639;
import 'package:test_app/core/app_config/app_config_module.dart' as _i1066;
import 'package:test_app/core/network/converter/json_to_type_converter.dart'
    as _i1061;
import 'package:test_app/core/network/converter/model_to_json_config.dart'
    as _i159;
import 'package:test_app/core/network/network_config_module.dart' as _i278;
import 'package:test_app/domain/currency/repository/currency_repository.dart'
    as _i556;
import 'package:test_app/infrastructure/currency/data_source/currency_data_source.dart'
    as _i817;
import 'package:test_app/infrastructure/currency/mapper/currency_mapper.dart'
    as _i38;
import 'package:test_app/infrastructure/currency/repository/currency_repository_impl.dart'
    as _i111;
import 'package:test_app/infrastructure/network/client/api_client.dart'
    as _i198;
import 'package:test_app/infrastructure/network/client/interceptor/authorization_interceptor.dart'
    as _i194;
import 'package:test_app/presentation/page/currency_list/cubit/currency_cubit.dart'
    as _i1048;
import 'package:test_app/presentation/router/app_router.dart' as _i1020;

const String _beta = 'beta';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final modelToJsonConfig = _$ModelToJsonConfig();
    final appConfigModule = _$AppConfigModule();
    final networkConfigModule = _$NetworkConfigModule(this);
    gh.factory<_i194.AuthorizationInterceptor>(
        () => const _i194.AuthorizationInterceptor());
    gh.factory<_i38.CurrencyMapper>(() => const _i38.CurrencyMapper());
    gh.lazySingleton<_i1020.AppRouter>(() => _i1020.AppRouter());
    gh.lazySingleton<Map<Type, Function>>(() => modelToJsonConfig.instance);
    gh.lazySingleton<_i639.AppConfig>(
      () => appConfigModule.appConfig,
      registerFor: {_beta},
    );
    gh.factory<_i1061.JsonToTypeConverter>(
        () => _i1061.JsonToTypeConverter(gh<Map<Type, Function>>()));
    gh.singleton<String>(
      () => networkConfigModule.apiBaseUrl(gh<_i639.AppConfig>()),
      instanceName: 'apiBaseUrl',
    );
    gh.lazySingleton<_i198.ApiClient>(() => networkConfigModule.apiClient);
    gh.lazySingleton<_i817.CurrencyDataSource>(
        () => _i817.CurrencyDataSource.create(gh<_i198.ApiClient>()));
    gh.lazySingleton<_i556.CurrencyRepository>(
        () => _i111.CurrencyRepositoryImpl(
              gh<_i817.CurrencyDataSource>(),
              gh<_i38.CurrencyMapper>(),
            ));
    gh.factory<_i1048.CurrencyCubit>(
        () => _i1048.CurrencyCubit(gh<_i556.CurrencyRepository>()));
    return this;
  }
}

class _$ModelToJsonConfig extends _i159.ModelToJsonConfig {}

class _$AppConfigModule extends _i1066.AppConfigModule {}

class _$NetworkConfigModule extends _i278.NetworkConfigModule {
  _$NetworkConfigModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i198.ApiClient get apiClient => _i198.ApiClient(
        _getIt<String>(instanceName: 'apiBaseUrl'),
        _getIt<_i194.AuthorizationInterceptor>(),
        _getIt<_i1061.JsonToTypeConverter>(),
      );
}
