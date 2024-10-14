// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/api/api_manager.dart' as _i1023;
import '../../features/auth/data/datasources/contracts/auth_datasource.dart'
    as _i449;
import '../../features/auth/data/datasources/impl/auth_datasource_impl.dart'
    as _i239;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/contracts/auth_repo.dart' as _i670;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i436;
import '../../features/auth/presentation/cubit/auth/auth_view_model.dart'
    as _i616;

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
    gh.singleton<_i1023.ApiManager>(() => _i1023.ApiManager());
    gh.factory<_i449.AuthDataSource>(
        () => _i239.AuthDataSourceImpl(gh<_i1023.ApiManager>()));
    gh.factory<_i670.AuthRepo>(
        () => _i662.AuthRepositoryImpl(gh<_i449.AuthDataSource>()));
    gh.factory<_i436.AuthUsecase>(
        () => _i436.AuthUsecase(authRepo: gh<_i670.AuthRepo>()));
    gh.factory<_i616.AuthViewModel>(
        () => _i616.AuthViewModel(gh<_i436.AuthUsecase>()));
    return this;
  }
}
