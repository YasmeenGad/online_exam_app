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
import '../../features/exam/data/api/exam_client.dart' as _i12;
import '../../features/exam/data/data_sources/contracts/exam_offline_datasource.dart'
    as _i203;
import '../../features/exam/data/data_sources/contracts/exam_online_datasource.dart'
    as _i926;
import '../../features/exam/data/data_sources/implement/exam_offline_datasource_impl.dart'
    as _i464;
import '../../features/exam/data/data_sources/implement/exam_online_datasource_impl.dart'
    as _i742;
import '../../features/exam/data/repositories/exam_repo_impl.dart' as _i1047;
import '../../features/exam/domain/repositories/exam_repo.dart' as _i377;
import '../../features/exam/domain/use_case/exam_use_case.dart' as _i315;
import '../../features/exam/presentation/manager/exam/exam_cubit.dart' as _i604;
import '../../features/exam/presentation/manager/subject/subject_cubit.dart'
    as _i294;
import '../../features/profile/data/api/profile_retrofit_client.dart' as _i915;
import '../../features/profile/data/datasources/contracts/offline_datasource/offline_profile_datasource.dart'
    as _i804;
import '../../features/profile/data/datasources/contracts/online_datasource/online_profile_datasource.dart'
    as _i266;
import '../../features/profile/data/datasources/impl/offline_profile_datasource_impl.dart'
    as _i444;
import '../../features/profile/data/datasources/impl/online_profile_datasource_impl.dart'
    as _i407;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i334;
import '../../features/profile/domain/contracts/profile_repository.dart'
    as _i435;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i996;
import '../../features/profile/presentation/cubit/profile_view_model.dart'
    as _i516;
import '../../features/questions/data/api/question_retrofit_client.dart'
    as _i287;
import '../../features/questions/data/datasource/contracts/offline_datasource/question_offline_datasource.dart'
    as _i733;
import '../../features/questions/data/datasource/contracts/online_datasource/questions_online_datasource.dart'
    as _i94;
import '../../features/questions/data/datasource/impl/questions_offline_datasource_impl.dart'
    as _i877;
import '../../features/questions/data/datasource/impl/questions_online_datasource_impl.dart'
    as _i635;
import '../../features/questions/data/repository/questions_repo_impl.dart'
    as _i904;
import '../../features/questions/domain/contracts/questions_repository.dart'
    as _i912;
import '../../features/questions/domain/usecase/questions_usecase.dart'
    as _i279;
import '../../features/questions/presentation/cubit/questions_view_model.dart'
    as _i1055;
import '../provider/language_provider.dart' as _i538;
import '../provider/language_service.dart' as _i734;
import '../utils/api/dio_factory.dart' as _i218;
import '../utils/api/network_module.dart' as _i498;

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
    gh.factory<_i218.DioFactory>(() => _i218.DioFactory());
    gh.singleton<_i1023.ApiManager>(() => _i1023.ApiManager());
    gh.lazySingleton<_i734.LanguageService>(() => _i734.LanguageService());
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.factory<_i538.LanguageProvider>(
        () => _i538.LanguageProvider(gh<_i734.LanguageService>()));
    gh.factory<_i203.ExamOfflineDatasource>(
        () => _i464.ExamOfflineDataSourceImpl());
    gh.factory<_i449.AuthDataSource>(
        () => _i239.AuthDataSourceImpl(gh<_i1023.ApiManager>()));
    gh.lazySingleton<_i12.ExamClient>(() => _i12.ExamClient(gh<_i361.Dio>()));
    gh.singleton<_i915.ProfileRetrofitClient>(
        () => _i915.ProfileRetrofitClient(gh<_i361.Dio>()));
    gh.singleton<_i287.QuestionRetrofitClient>(
        () => _i287.QuestionRetrofitClient(gh<_i361.Dio>()));
    gh.factory<_i331.OfflineAuthDataSource>(
        () => _i110.OfflineAuthDataSourceImpl());
    gh.factory<_i804.OfflineProfileDataSource>(
        () => _i444.OfflineProfileDataSourceImpl());
    gh.factory<_i94.QuestionsOnlineDatasource>(() =>
        _i635.QuestionsOnlineDatasourceImpl(
            gh<_i287.QuestionRetrofitClient>()));
    gh.factory<_i733.QuestionsOfflineDatasource>(
        () => _i877.QuestionsOfflineDatasourceImpl());
    gh.factory<_i912.QuestionsRepository>(() => _i904.QuestionsRepositoryImpl(
          gh<_i94.QuestionsOnlineDatasource>(),
          gh<_i733.QuestionsOfflineDatasource>(),
        ));
    gh.factory<_i926.ExamOnlineDataSource>(
        () => _i742.ExamOnlineDataSourceImpl(gh<_i12.ExamClient>()));
    gh.factory<_i266.OnlineProfileDataSource>(
        () => _i407.ProfileDataSourceImpl(gh<_i915.ProfileRetrofitClient>()));
    gh.factory<_i377.ExamRepo>(() => _i1047.ExamRepoImpl(
          gh<_i926.ExamOnlineDataSource>(),
          gh<_i203.ExamOfflineDatasource>(),
        ));
    gh.factory<_i670.AuthRepo>(
        () => _i662.AuthRepositoryImpl(gh<_i449.AuthDataSource>()));
    gh.factory<_i279.QuestionsUseCase>(
        () => _i279.QuestionsUseCase(gh<_i912.QuestionsRepository>()));
    gh.factory<_i435.ProfileRepository>(() => _i334.ProfileRepositoryImpl(
          gh<_i266.OnlineProfileDataSource>(),
          gh<_i804.OfflineProfileDataSource>(),
        ));
    gh.factory<_i436.AuthUsecase>(
        () => _i436.AuthUsecase(authRepo: gh<_i670.AuthRepo>()));
    gh.factory<_i315.ExamUseCase>(
        () => _i315.ExamUseCase(gh<_i377.ExamRepo>()));
    gh.factory<_i996.ProfileUseCase>(
        () => _i996.ProfileUseCase(gh<_i435.ProfileRepository>()));
    gh.factory<_i516.ProfileViewModel>(
        () => _i516.ProfileViewModel(gh<_i996.ProfileUseCase>()));
    gh.factory<_i1055.QuestionsViewModel>(
        () => _i1055.QuestionsViewModel(gh<_i279.QuestionsUseCase>()));
    gh.factory<_i616.AuthViewModel>(() => _i616.AuthViewModel(
          gh<_i436.AuthUsecase>(),
          gh<_i331.OfflineAuthDataSource>(),
        ));
    gh.factory<_i604.ExamCubit>(() => _i604.ExamCubit(gh<_i315.ExamUseCase>()));
    gh.factory<_i294.SubjectCubit>(
        () => _i294.SubjectCubit(gh<_i315.ExamUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i498.NetworkModule {}
