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
import 'package:isar/isar.dart' as _i19;

import '../../features/auth/data/api/api_manager.dart' as _i3;
import '../../features/auth/data/datasources/contracts/auth_datasource.dart'
    as _i4;
import '../../features/auth/data/datasources/contracts/offline_auth_datasource.dart'
    as _i21;
import '../../features/auth/data/datasources/impl/auth_datasource_impl.dart'
    as _i5;
import '../../features/auth/data/datasources/impl/offline_auth_datasource_impl.dart'
    as _i22;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i7;
import '../../features/auth/domain/contracts/auth_repo.dart' as _i6;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i8;
import '../../features/auth/presentation/cubit/auth/auth_view_model.dart'
    as _i36;
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
import '../../features/exam/presentation/manager/exam/exam_cubit.dart' as _i37;
import '../../features/exam/presentation/manager/subject/subject_cubit.dart'
    as _i35;
import '../../features/profile/data/api/profile_retrofit_client.dart' as _i25;
import '../../features/profile/data/datasources/contracts/offline_datasource/offline_profile_datasource.dart'
    as _i23;
import '../../features/profile/data/datasources/contracts/online_datasource/online_profile_datasource.dart'
    as _i39;
import '../../features/profile/data/datasources/impl/offline_profile_datasource_impl.dart'
    as _i24;
import '../../features/profile/data/datasources/impl/online_profile_datasource_impl.dart'
    as _i40;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i42;
import '../../features/profile/domain/contracts/profile_repository.dart'
    as _i41;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i43;
import '../../features/profile/presentation/cubit/profile_view_model.dart'
    as _i44;
import '../../features/questions/data/api/question_retrofit_client.dart'
    as _i28;
import '../../features/questions/data/datasource/contracts/offline_datasource/question_offline_data_source.dart'
    as _i26;
import '../../features/questions/data/datasource/contracts/online_datasource/questions_online_datasource.dart'
    as _i29;
import '../../features/questions/data/datasource/impl/question_offline_data_source_impl.dart'
    as _i27;
import '../../features/questions/data/datasource/impl/questions_online_datasource_impl.dart'
    as _i30;
import '../../features/questions/data/repository/questions_repo_impl.dart'
    as _i32;
import '../../features/questions/domain/contracts/questions_repository.dart'
    as _i31;
import '../../features/questions/domain/usecase/questions_usecase.dart' as _i33;
import '../../features/questions/presentation/cubit/questions_view_model.dart'
    as _i34;
import '../database/isar_service.dart' as _i46;
import '../provider/language_provider.dart' as _i38;
import '../provider/language_service.dart' as _i20;
import '../utils/api/dio_factory.dart' as _i10;
import '../utils/api/network_module.dart' as _i45;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final isarModule = _$IsarModule();
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
    await gh.factoryAsync<_i19.Isar>(
      () => isarModule.isarProvider,
      preResolve: true,
    );
    gh.lazySingleton<_i20.LanguageService>(() => _i20.LanguageService());
    gh.factory<_i21.OfflineAuthDataSource>(
        () => _i22.OfflineAuthDataSourceImpl());
    gh.factory<_i23.OfflineProfileDataSource>(
        () => _i24.OfflineProfileDataSourceImpl());
    gh.singleton<_i25.ProfileRetrofitClient>(
        () => _i25.ProfileRetrofitClient(gh<_i9.Dio>()));
    gh.factory<_i26.QuestionOfflineDataSource>(
        () => _i27.QuestionOfflineDataSourceImpl(gh<_i19.Isar>()));
    gh.singleton<_i28.QuestionRetrofitClient>(
        () => _i28.QuestionRetrofitClient(gh<_i9.Dio>()));
    gh.factory<_i29.QuestionsOnlineDatasource>(() =>
        _i30.QuestionsOnlineDatasourceImpl(gh<_i28.QuestionRetrofitClient>()));
    gh.factory<_i31.QuestionsRepository>(() => _i32.QuestionsRepositoryImpl(
          gh<_i29.QuestionsOnlineDatasource>(),
          gh<_i26.QuestionOfflineDataSource>(),
        ));
    gh.factory<_i33.QuestionsUseCase>(
        () => _i33.QuestionsUseCase(gh<_i31.QuestionsRepository>()));
    gh.factory<_i34.QuestionsViewModel>(
        () => _i34.QuestionsViewModel(gh<_i33.QuestionsUseCase>()));
    gh.factory<_i35.SubjectCubit>(
        () => _i35.SubjectCubit(gh<_i18.ExamUseCase>()));
    gh.factory<_i36.AuthViewModel>(() => _i36.AuthViewModel(
          gh<_i8.AuthUsecase>(),
          gh<_i21.OfflineAuthDataSource>(),
        ));
    gh.factory<_i37.ExamCubit>(() => _i37.ExamCubit(gh<_i18.ExamUseCase>()));
    gh.factory<_i38.LanguageProvider>(
        () => _i38.LanguageProvider(gh<_i20.LanguageService>()));
    gh.factory<_i39.OnlineProfileDataSource>(
        () => _i40.ProfileDataSourceImpl(gh<_i25.ProfileRetrofitClient>()));
    gh.factory<_i41.ProfileRepository>(() => _i42.ProfileRepositoryImpl(
          gh<_i39.OnlineProfileDataSource>(),
          gh<_i23.OfflineProfileDataSource>(),
        ));
    gh.factory<_i43.ProfileUseCase>(
        () => _i43.ProfileUseCase(gh<_i41.ProfileRepository>()));
    gh.factory<_i44.ProfileViewModel>(
        () => _i44.ProfileViewModel(gh<_i43.ProfileUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i45.NetworkModule {}

class _$IsarModule extends _i46.IsarModule {}
