import '../data/repository/interceptor/interceptor.dart';
import '../data/repository/local/local_data_access.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/local/shared_pref_helper.dart';
import '../data/repository/remote/repository.dart';
import '../domain/mapper/event_data_mapper.dart';
import '../domain/mapper/user_data_mapper.dart';
import '../shared/utils/geocoding_helper.dart';
import '../view/base/bloc/auth/auth_bloc.dart';
import '../view/base/bloc/common/common_cubit.dart';
import '../view/base/bloc/user/user_cubit.dart';
import '../view/event_page/cubit/event_cubit.dart';

final getIt = GetIt.instance;

configureInjection() async {
  getIt.registerFactory<Dio>(() => Dio());

  getIt.registerLazySingleton<StorageRepository>(() => StorageRepositoryImpl(
      dio: getIt<Dio>(), localDataAccess: getIt.get<LocalDataAccess>()));

  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());

  getIt.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
        dio: getIt<Dio>(),
        localDataAccess: getIt.get<LocalDataAccess>(),
        openIdRepository: getIt.get<OpenIDRepository>()),
  );

  getIt.registerLazySingleton<EventRepository>(() => EventRepositoryImpl());

  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());

  getIt.registerLazySingleton<OpenIDRepository>(
      () => OpenIDRepositoryImpl(dio: getIt<Dio>()));

  getIt.registerLazySingleton<UtilityRepository>(
      <UtilityRepository>() => UtilitiesRepositoryImpl(dio: getIt<Dio>()));

  final sharedPref = await SharedPreferences.getInstance();
  // getIt.registerSingleton<SharedPreferences>(sharedPref);

  getIt.registerLazySingleton<LocalDataAccess>(
      () => SharePrefHelper(sharedPref: sharedPref));

  getIt.registerFactory<GeocodingHelper>(() => GeocodingHelper());

// interceptor
  getIt.registerLazySingleton<AppInterceptor>(() => AppInterceptor());

  // mapper
  getIt.registerLazySingleton<UserDataMapper>(() => UserDataMapper());
  getIt.registerLazySingleton<EventDataMapper>(() => EventDataMapper());
  getIt.registerLazySingleton<EventMemberDataMapper>(
      () => EventMemberDataMapper());

  // bloc
  getIt.registerSingleton<AuthBloc>(AuthBloc());
  getIt.registerSingleton<CommonCubit>(CommonCubit());
  getIt.registerSingleton<UserCubit>(UserCubit());
  getIt.registerFactory<EventCubit>(() => EventCubit());
}
