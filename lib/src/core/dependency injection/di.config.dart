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
import '../../features/auth/data/datasources/constracts/auth_datasource.dart'
    as _i438;
import '../../features/auth/data/datasources/impl/auth_datasource_impl.dart'
    as _i239;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/contracts/repositories/auth_repo.dart'
    as _i997;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/password_usecase.dart' as _i72;
import '../../features/auth/domain/usecases/signup_usecase.dart' as _i57;
import '../../features/auth/presentation/cubit/forget_password/password_cubit.dart'
    as _i490;
import '../../features/auth/presentation/cubit/login/login_cubit.dart' as _i264;
import '../../features/auth/presentation/cubit/signup/auth_view_model.dart'
    as _i466;

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
    gh.factory<_i438.AuthDataSource>(
        () => _i239.AuthDataSourceImpl(gh<_i1023.ApiManager>()));
    gh.factory<_i997.AuthRepo>(
        () => _i662.AuthRepositoryImpl(gh<_i438.AuthDataSource>()));
    gh.factory<_i188.LoginUseCase>(
        () => _i188.LoginUseCase(gh<_i997.AuthRepo>()));
    gh.factory<_i72.PasswordUseCase>(
        () => _i72.PasswordUseCase(gh<_i997.AuthRepo>()));
    gh.factory<_i57.SignupUsecase>(
        () => _i57.SignupUsecase(gh<_i997.AuthRepo>()));
    gh.factory<_i490.PasswordCubit>(
        () => _i490.PasswordCubit(gh<_i72.PasswordUseCase>()));
    gh.factory<_i264.LoginCubit>(
        () => _i264.LoginCubit(gh<_i188.LoginUseCase>()));
    gh.factory<_i466.AuthViewModel>(
        () => _i466.AuthViewModel(gh<_i57.SignupUsecase>()));
    return this;
  }
}
