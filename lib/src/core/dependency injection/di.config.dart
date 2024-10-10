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
import '../../features/auth/data/datasources/contracts/sign_up_datasource_online.dart'
    as _i976;
import '../../features/auth/data/datasources/impl/sign_up_datasource_online_impl.dart'
    as _i880;
import '../../features/auth/data/repositories/sign_up_repo_impl.dart' as _i643;
import '../../features/auth/domain/contracts/repositories/sign_up_repo.dart'
    as _i368;
import '../../features/auth/domain/usecases/signup_usecase.dart' as _i57;
import '../../features/auth/presentation/cubit/auth_view_model.dart' as _i745;

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
    gh.factory<_i976.SignUpDatasourceOnline>(
        () => _i880.SignUpDatasourceOnlineImpl(gh<_i1023.ApiManager>()));
    gh.factory<_i368.SignUpRepository>(
        () => _i643.SignUpRepositoryImpl(gh<_i976.SignUpDatasourceOnline>()));
    gh.factory<_i57.SignupUsecase>(
        () => _i57.SignupUsecase(gh<_i368.SignUpRepository>()));
    gh.factory<_i745.AuthViewModel>(
        () => _i745.AuthViewModel(gh<_i57.SignupUsecase>()));
    return this;
  }
}
