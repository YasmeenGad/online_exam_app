// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/data/api/api_manager.dart' as _i1023;
import '../../features/auth/data/datasources/contracts/auth_datasource.dart'
    as _i449;
import '../../features/auth/data/datasources/contracts/offline_auth_datasource.dart'
    as _i331;
import '../../features/auth/data/datasources/impl/auth_datasource_impl.dart'
    as _i239;
import '../../features/auth/data/datasources/impl/offline_auth_datasource_impl.dart'
    as _i110;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/contracts/auth_repo.dart' as _i670;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i436;
import '../../features/auth/presentation/cubit/auth/auth_view_model.dart'
    as _i616;
import '../../features/profile/data/api/network_module.dart' as _i442;
import '../../features/profile/data/api/profile_retrofit_client.dart' as _i915;
import '../../features/profile/data/datasources/contracts/online_datasource/profile_datasource.dart'
    as _i907;
import '../../features/profile/data/datasources/impl/profile_datasource_impl.dart'
    as _i966;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i334;
import '../../features/profile/domain/contracts/profile_repository.dart'
    as _i435;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i996;
import '../../features/profile/presentation/cubit/profile_view_model.dart'
    as _i516;
import '../provider/language_provider.dart' as _i538;
import '../provider/language_service.dart' as _i734;

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
    final networkModule = _$NetworkModule();
    gh.factory<_i528.PrettyDioLogger>(
        () => networkModule.provideLogInterceptor());
    gh.singleton<_i1023.ApiManager>(() => _i1023.ApiManager());
    gh.lazySingleton<_i734.LanguageService>(() => _i734.LanguageService());
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.factory<_i538.LanguageProvider>(
        () => _i538.LanguageProvider(gh<_i734.LanguageService>()));
    gh.factory<_i449.AuthDataSource>(
        () => _i239.AuthDataSourceImpl(gh<_i1023.ApiManager>()));
    gh.singleton<_i915.ProfileRetrofitClient>(
        () => _i915.ProfileRetrofitClient(gh<_i361.Dio>()));
    gh.factory<_i331.OfflineAuthDataSource>(
        () => _i110.OfflineAuthDataSourceImpl());
    gh.factory<_i907.OnlineProfileDataSource>(
        () => _i966.ProfileDataSourceImpl(gh<_i915.ProfileRetrofitClient>()));
    gh.factory<_i435.ProfileRepository>(
        () => _i334.ProfileRepositoryImpl(gh<_i907.OnlineProfileDataSource>()));
    gh.factory<_i670.AuthRepo>(
        () => _i662.AuthRepositoryImpl(gh<_i449.AuthDataSource>()));
    gh.factory<_i436.AuthUsecase>(
        () => _i436.AuthUsecase(authRepo: gh<_i670.AuthRepo>()));
    gh.factory<_i996.ProfileUseCase>(
        () => _i996.ProfileUseCase(gh<_i435.ProfileRepository>()));
    gh.factory<_i516.ProfileViewModel>(
        () => _i516.ProfileViewModel(gh<_i996.ProfileUseCase>()));
    gh.factory<_i616.AuthViewModel>(() => _i616.AuthViewModel(
          gh<_i436.AuthUsecase>(),
          gh<_i331.OfflineAuthDataSource>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i442.NetworkModule {}
