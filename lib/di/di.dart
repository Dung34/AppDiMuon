import '../data/repository/interceptor/interceptor.dart';
import '../data/repository/local/local_data_access.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/local/shared_pref_helper.dart';
import '../data/repository/remote/gen_report_repo_impl.dart';
import '../data/repository/remote/gen_report_repository.dart';
import '../data/repository/remote/report_repository.dart';
import '../data/repository/remote/report_repository_impl.dart';
import '../data/repository/remote/login_repository.dart';
import '../data/repository/remote/login_repository_impl.dart';
import '../data/repository/remote/project_list_repository.dart';
import '../data/repository/remote/project_list_repository_impl.dart';
import '../data/repository/remote/repository.dart';
import '../data/repository/remote/skill_repository.dart';
import '../data/repository/remote/skill_repository_ipml.dart';
import '../domain/mapper/event_data_mapper.dart';

import '../domain/mapper/general_report_mapper.dart';
import '../domain/mapper/list_gen_report_mapper.dart';
import '../domain/mapper/list_report_data_mapper.dart';
import '../domain/mapper/project_data_mapper.dart';
import '../domain/mapper/report_data_mapper.dart';

import '../domain/mapper/skill_data_mapper.dart';
import '../domain/mapper/user_data_mapper.dart';
import '../shared/utils/geocoding_helper.dart';
import '../view/base/bloc/auth/auth_bloc.dart';
import '../view/base/bloc/common/common_cubit.dart';
import '../view/base/bloc/general_report/general_report_cubit.dart';
import '../view/base/bloc/report/report_cubit.dart';
import '../view/base/bloc/skill/skill_cubit.dart';
import '../view/base/bloc/user/user_cubit.dart';
import '../view/event_page/cubit/event_cubit.dart';
import '../view/project_page/cubit/project_cubit.dart';

final getIt = GetIt.instance;

configureInjection() async {
  getIt.registerFactory<Dio>(() => Dio());

  getIt.registerFactory<StorageRepository>(() => StorageRepositoryImpl(
      dio: getIt<Dio>(), localDataAccess: getIt.get<LocalDataAccess>()));

  getIt.registerFactory<UserRepository>(() => UserRepositoryImpl());

  getIt.registerFactory<AppRepository>(
    () => AppRepositoryImpl(
        dio: getIt<Dio>(),
        localDataAccess: getIt.get<LocalDataAccess>(),
        openIdRepository: getIt.get<OpenIDRepository>()),
  );

  getIt.registerFactory<EventRepository>(() => EventRepositoryImpl());
  getIt.registerFactory<ReportRepository>(() => ReportRepositoryImplement());
  getIt.registerFactory<GeneralReportRepository>(
      () => GeneralReportRepositoryImpl());

  getIt.registerFactory<ProjectListRepository>(
      () => ProjectListRepositoryImpl());

  getIt.registerFactory<ProfileRepository>(() => ProfileRepositoryImpl());

  getIt.registerFactory<OpenIDRepository>(
      () => OpenIDRepositoryImpl(dio: getIt<Dio>()));

  getIt.registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(dio: getIt<Dio>()));

  getIt.registerFactory<UtilityRepository>(
      <UtilityRepository>() => UtilitiesRepositoryImpl(dio: getIt<Dio>()));

  final sharedPref = await SharedPreferences.getInstance();
  // getIt.registerSingleton<SharedPreferences>(sharedPref);

  getIt.registerFactory<SkillRepository>(() => SkillRepositoryImplement());

  getIt.registerLazySingleton<LocalDataAccess>(
      () => SharePrefHelper(sharedPref: sharedPref));

  getIt.registerFactory<GeocodingHelper>(() => GeocodingHelper());

// interceptor
  getIt.registerLazySingleton<AppInterceptor>(() => AppInterceptor());

  // mapper
  getIt.registerFactory<UserDataMapper>(() => UserDataMapper());
  getIt.registerFactory<CheckinDataMapper>(() => CheckinDataMapper());
  getIt.registerFactory<EventDataMapper>(() => EventDataMapper());
  getIt.registerFactory<EventMemberDataMapper>(() => EventMemberDataMapper());
  getIt.registerFactory<ProjectListDataMapper>(() => ProjectListDataMapper());
  getIt.registerFactory<ProjectDataMapper>(() => ProjectDataMapper());

  getIt.registerFactory<ReportDataMapper>(() => ReportDataMapper());
  getIt.registerFactory<ListReportDataMapper>(() => ListReportDataMapper());
  getIt.registerFactory<GeneralReportMapper>(() => GeneralReportMapper());
  getIt.registerFactory<ListGeneralReportMapper>(
      () => ListGeneralReportMapper());
  getIt.registerFactory<SkillDataMapper>(() => SkillDataMapper());
  getIt.registerFactory<ListSkillMapper>(() => ListSkillMapper());

  // bloc
  getIt.registerSingleton<AuthBloc>(AuthBloc());
  getIt.registerSingleton<CommonCubit>(CommonCubit());
  getIt.registerSingleton<UserCubit>(UserCubit());
  getIt.registerFactory<EventCubit>(() => EventCubit());
  getIt.registerFactory<ProjectCubit>(() => ProjectCubit());
  getIt.registerFactory<ReportCubit>(() => ReportCubit());
  getIt.registerFactory<GeneralReportCubit>(() => GeneralReportCubit());
  getIt.registerFactory<SkillCubit>(() => SkillCubit());
}
