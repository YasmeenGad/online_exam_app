// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i20;

import '../../features/auth/data/api/api_manager.dart' as _i3;
import '../../features/auth/data/data_sources/contracts/auth_datasource.dart'
    as _i4;
import '../../features/auth/data/data_sources/contracts/offline_auth_datasource.dart'
    as _i22;
import '../../features/auth/data/data_sources/impl/auth_datasource_impl.dart'
    as _i5;
import '../../features/auth/data/data_sources/impl/offline_auth_datasource_impl.dart'
    as _i23;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i7;
import '../../features/auth/domain/contracts/auth_repo.dart' as _i6;
import '../../features/auth/domain/usecases/auth_usecase.dart' as _i8;
import '../../features/auth/presentation/cubit/auth/auth_view_model.dart'
    as _i9;
import '../../features/exam/data/api/exam_client.dart' as _i12;
import '../../features/exam/data/data_sources/contracts/exam_offline_datasource.dart'
    as _i13;
import '../../features/exam/data/data_sources/contracts/exam_online_datasource.dart'
    as _i15;
import '../../features/exam/data/data_sources/implement/exam_offline_datasource_impl.dart'
    as _i14;
import '../../features/exam/data/data_sources/implement/exam_online_datasource_impl.dart'
    as _i16;
import '../../features/exam/data/repositories/exam_repo_impl.dart' as _i18;
import '../../features/exam/domain/repositories/exam_repo.dart' as _i17;
import '../../features/exam/domain/use_case/exam_use_case.dart' as _i19;
import '../../features/exam/presentation/manager/exam/exam_cubit.dart' as _i39;
import '../../features/exam/presentation/manager/subject/subject_cubit.dart'
    as _i38;
import '../../features/profile/data/api/profile_retrofit_client.dart' as _i26;
import '../../features/profile/data/datasources/contracts/offline_datasource/offline_profile_datasource.dart'
    as _i24;
import '../../features/profile/data/datasources/contracts/online_datasource/online_profile_datasource.dart'
    as _i41;
import '../../features/profile/data/datasources/impl/offline_profile_datasource_impl.dart'
    as _i25;
import '../../features/profile/data/datasources/impl/online_profile_datasource_impl.dart'
    as _i42;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i44;
import '../../features/profile/domain/contracts/profile_repository.dart'
    as _i43;
import '../../features/profile/domain/usecases/profile_usecase.dart' as _i45;
import '../../features/profile/presentation/cubit/profile_view_model.dart'
    as _i46;
import '../../features/questions/data/api/question_retrofit_client.dart'
    as _i29;
import '../../features/questions/data/datasource/contracts/offline_datasource/question_offline_data_source.dart'
    as _i27;
import '../../features/questions/data/datasource/contracts/offline_datasource/question_offline_datasource.dart'
    as _i30;
import '../../features/questions/data/datasource/contracts/online_datasource/questions_online_datasource.dart'
    as _i32;
import '../../features/questions/data/datasource/impl/question_offline_data_source_impl.dart'
    as _i28;
import '../../features/questions/data/datasource/impl/questions_offline_datasource_impl.dart'
    as _i31;
import '../../features/questions/data/datasource/impl/questions_online_datasource_impl.dart'
    as _i33;
import '../../features/questions/data/repository/questions_repo_impl.dart'
    as _i35;
import '../../features/questions/domain/contracts/questions_repository.dart'
    as _i34;
import '../../features/questions/domain/usecase/questions_usecase.dart' as _i36;
import '../../features/questions/presentation/cubit/questions_view_model.dart'
    as _i37;
import '../database/isar_service.dart' as _i48;
import '../provider/language_provider.dart' as _i40;
import '../provider/language_service.dart' as _i21;
import '../utils/api/dio_factory.dart' as _i11;
import '../utils/api/network_module.dart' as _i47;

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
    gh.factory<_i9.AuthViewModel>(
        () => _i9.AuthViewModel(gh<_i8.AuthUsecase>()));
    gh.lazySingleton<_i10.Dio>(() => networkModule.dio);
    gh.factory<_i11.DioFactory>(() => _i11.DioFactory());
    gh.lazySingleton<_i12.ExamClient>(() => _i12.ExamClient(gh<_i10.Dio>()));
    gh.factory<_i13.ExamOfflineDatasource>(
        () => _i14.ExamOfflineDataSourceImpl());
    gh.factory<_i15.ExamOnlineDataSource>(
        () => _i16.ExamOnlineDataSourceImpl(gh<_i12.ExamClient>()));
    gh.factory<_i17.ExamRepo>(() => _i18.ExamRepoImpl(
          gh<_i15.ExamOnlineDataSource>(),
          gh<_i13.ExamOfflineDatasource>(),
        ));
    gh.factory<_i19.ExamUseCase>(() => _i19.ExamUseCase(gh<_i17.ExamRepo>()));
    await gh.factoryAsync<_i20.Isar>(
      () => isarModule.isarProvider,
      preResolve: true,
    );
    gh.lazySingleton<_i21.LanguageService>(() => _i21.LanguageService());
    gh.factory<_i22.OfflineAuthDataSource>(
        () => _i23.OfflineAuthDataSourceImpl());
    gh.factory<_i24.OfflineProfileDataSource>(
        () => _i25.OfflineProfileDataSourceImpl());
    gh.singleton<_i26.ProfileRetrofitClient>(
        () => _i26.ProfileRetrofitClient(gh<_i10.Dio>()));
    gh.factory<_i27.QuestionOfflineDataSource>(
        () => _i28.QuestionOfflineDataSourceImpl(gh<_i20.Isar>()));
    gh.singleton<_i29.QuestionRetrofitClient>(
        () => _i29.QuestionRetrofitClient(gh<_i10.Dio>()));
    gh.factory<_i30.QuestionsOfflineDatasource>(
        () => _i31.QuestionsOfflineDatasourceImpl());
    gh.factory<_i32.QuestionsOnlineDatasource>(() =>
        _i33.QuestionsOnlineDatasourceImpl(gh<_i29.QuestionRetrofitClient>()));
    gh.factory<_i34.QuestionsRepository>(() => _i35.QuestionsRepositoryImpl(
          gh<_i32.QuestionsOnlineDatasource>(),
          gh<_i30.QuestionsOfflineDatasource>(),
          gh<_i27.QuestionOfflineDataSource>(),
        ));
    gh.factory<_i36.QuestionsUseCase>(
        () => _i36.QuestionsUseCase(gh<_i34.QuestionsRepository>()));
    gh.factory<_i37.QuestionsViewModel>(() => _i37.QuestionsViewModel(
          gh<_i36.QuestionsUseCase>(),
          gh<_i22.OfflineAuthDataSource>(),
          gh<_i27.QuestionOfflineDataSource>(),
          gh<_i30.QuestionsOfflineDatasource>(),
        ));
    gh.factory<_i38.SubjectCubit>(
        () => _i38.SubjectCubit(gh<_i19.ExamUseCase>()));
    gh.factory<_i39.ExamCubit>(() => _i39.ExamCubit(gh<_i19.ExamUseCase>()));
    gh.factory<_i40.LanguageProvider>(
        () => _i40.LanguageProvider(gh<_i21.LanguageService>()));
    gh.factory<_i41.OnlineProfileDataSource>(
        () => _i42.ProfileDataSourceImpl(gh<_i26.ProfileRetrofitClient>()));
    gh.factory<_i43.ProfileRepository>(() => _i44.ProfileRepositoryImpl(
          gh<_i41.OnlineProfileDataSource>(),
          gh<_i24.OfflineProfileDataSource>(),
        ));
    gh.factory<_i45.ProfileUseCase>(
        () => _i45.ProfileUseCase(gh<_i43.ProfileRepository>()));
    gh.factory<_i46.ProfileViewModel>(
        () => _i46.ProfileViewModel(gh<_i45.ProfileUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i47.NetworkModule {}

class _$IsarModule extends _i48.IsarModule {}
