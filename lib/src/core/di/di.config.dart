// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/api/api_manager.dart' as _i3;
import '../../features/auth/data/datasources/contracts/auth_datasource.dart'
    as _i4;
import '../../features/auth/data/datasources/contracts/offline_auth_datasource.dart'
    as _i20;
import '../../features/auth/data/datasources/impl/auth_datasource_impl.dart'
    as _i5;
import '../../features/auth/data/datasources/impl/offline_auth_datasource_impl.dart'
    as _i21;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i7;
import '../../features/auth/domain/contracts/auth_repo.dart' as _i6;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i8;
import '../../features/auth/presentation/cubit/auth/auth_view_model.dart'
    as _i35;
import '../../features/exam/data/api/exam_client.dart' as _i11;
import '../../features/exam/data/data_sources/contracts/exam_offline_datasource.dart'
    as _i12;
import '../../features/exam/data/data_sources/contracts/exam_online_datasource.dart'
    as _i14;
import '../../features/exam/data/data_sources/implement/exam_offline_datasource_impl.dart'
    as _i13;
import '../../features/exam/data/data_sources/implement/exam_online_datasource_impl.dart'
    as _i15;
import '../../features/exam/data/repositories/exam_repo_impl.dart' as _i17;
import '../../features/exam/domain/repositories/exam_repo.dart' as _i16;
import '../../features/exam/domain/use_case/exam_use_case.dart' as _i18;
import '../../features/exam/presentation/manager/exam/exam_cubit.dart' as _i36;
import '../../features/exam/presentation/manager/subject/subject_cubit.dart'
    as _i34;
import '../../features/profile/data/api/profile_retrofit_client.dart' as _i24;
import '../../features/profile/data/datasources/contracts/offline_datasource/offline_profile_datasource.dart'
    as _i22;
import '../../features/profile/data/datasources/contracts/online_datasource/online_profile_datasource.dart'
    as _i38;
import '../../features/profile/data/datasources/impl/offline_profile_datasource_impl.dart'
    as _i23;
import '../../features/profile/data/datasources/impl/online_profile_datasource_impl.dart'
    as _i39;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i41;
import '../../features/profile/domain/contracts/profile_repository.dart'
    as _i40;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i42;
import '../../features/profile/presentation/cubit/profile_view_model.dart'
    as _i43;
import '../../features/questions/data/api/question_retrofit_client.dart'
    as _i25;
import '../../features/questions/data/datasource/contracts/offline_datasource/question_offline_datasource.dart'
    as _i26;
import '../../features/questions/data/datasource/contracts/online_datasource/questions_online_datasource.dart'
    as _i28;
import '../../features/questions/data/datasource/impl/questions_offline_datasource_impl.dart'
    as _i27;
import '../../features/questions/data/datasource/impl/questions_online_datasource_impl.dart'
    as _i29;
import '../../features/questions/data/repository/questions_repo_impl.dart'
    as _i31;
import '../../features/questions/domain/contracts/questions_repository.dart'
    as _i30;
import '../../features/questions/domain/usecase/questions_usecase.dart' as _i32;
import '../../features/questions/presentation/cubit/questions_view_model.dart'
    as _i33;
import '../provider/language_provider.dart' as _i37;
import '../provider/language_service.dart' as _i19;
import '../utils/api/dio_factory.dart' as _i10;
import '../utils/api/network_module.dart' as _i44;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.AuthDataSource>(
        () => _i5.AuthDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthRepo>(
        () => _i7.AuthRepositoryImpl(gh<_i4.AuthDataSource>()));
    gh.factory<_i8.AuthUsecase>(
        () => _i8.AuthUsecase(authRepo: gh<_i6.AuthRepo>()));
    gh.lazySingleton<_i9.Dio>(() => networkModule.dio);
    gh.factory<_i10.DioFactory>(() => _i10.DioFactory());
    gh.lazySingleton<_i11.ExamClient>(() => _i11.ExamClient(gh<_i9.Dio>()));
    gh.factory<_i12.ExamOfflineDatasource>(
        () => _i13.ExamOfflineDataSourceImpl());
    gh.factory<_i14.ExamOnlineDataSource>(
        () => _i15.ExamOnlineDataSourceImpl(gh<_i11.ExamClient>()));
    gh.factory<_i16.ExamRepo>(() => _i17.ExamRepoImpl(
          gh<_i14.ExamOnlineDataSource>(),
          gh<_i12.ExamOfflineDatasource>(),
        ));
    gh.factory<_i18.ExamUseCase>(() => _i18.ExamUseCase(gh<_i16.ExamRepo>()));
    gh.lazySingleton<_i19.LanguageService>(() => _i19.LanguageService());
    gh.factory<_i20.OfflineAuthDataSource>(
        () => _i21.OfflineAuthDataSourceImpl());
    gh.factory<_i22.OfflineProfileDataSource>(
        () => _i23.OfflineProfileDataSourceImpl());
    gh.singleton<_i24.ProfileRetrofitClient>(
        () => _i24.ProfileRetrofitClient(gh<_i9.Dio>()));
    gh.singleton<_i25.QuestionRetrofitClient>(
        () => _i25.QuestionRetrofitClient(gh<_i9.Dio>()));
    gh.factory<_i26.QuestionsOfflineDatasource>(
        () => _i27.QuestionsOfflineDatasourceImpl());
    gh.factory<_i28.QuestionsOnlineDatasource>(() =>
        _i29.QuestionsOnlineDatasourceImpl(gh<_i25.QuestionRetrofitClient>()));
    gh.factory<_i30.QuestionsRepository>(() => _i31.QuestionsRepositoryImpl(
          gh<_i28.QuestionsOnlineDatasource>(),
          gh<_i26.QuestionsOfflineDatasource>(),
        ));
    gh.factory<_i32.QuestionsUseCase>(
        () => _i32.QuestionsUseCase(gh<_i30.QuestionsRepository>()));
    gh.factory<_i33.QuestionsViewModel>(
        () => _i33.QuestionsViewModel(gh<_i32.QuestionsUseCase>()));
    gh.factory<_i34.SubjectCubit>(
        () => _i34.SubjectCubit(gh<_i18.ExamUseCase>()));
    gh.factory<_i35.AuthViewModel>(() => _i35.AuthViewModel(
          gh<_i8.AuthUsecase>(),
          gh<_i20.OfflineAuthDataSource>(),
        ));
    gh.factory<_i36.ExamCubit>(() => _i36.ExamCubit(gh<_i18.ExamUseCase>()));
    gh.factory<_i37.LanguageProvider>(
        () => _i37.LanguageProvider(gh<_i19.LanguageService>()));
    gh.factory<_i38.OnlineProfileDataSource>(
        () => _i39.ProfileDataSourceImpl(gh<_i24.ProfileRetrofitClient>()));
    gh.factory<_i40.ProfileRepository>(() => _i41.ProfileRepositoryImpl(
          gh<_i38.OnlineProfileDataSource>(),
          gh<_i22.OfflineProfileDataSource>(),
        ));
    gh.factory<_i42.ProfileUseCase>(
        () => _i42.ProfileUseCase(gh<_i40.ProfileRepository>()));
    gh.factory<_i43.ProfileViewModel>(
        () => _i43.ProfileViewModel(gh<_i42.ProfileUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i44.NetworkModule {}
