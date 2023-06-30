import '../data/repository/local/local_data_access.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/local/shared_pref_helper.dart';
import '../data/repository/remote/repository.dart';
import '../domain/mapper/user_data_mapper.dart';
import '../view/base/bloc/common/common_cubit.dart';
import '../view/base/bloc/user/user_cubit.dart';
import '../view/event_page/cubit/event_cubit.dart';

final getIt = GetIt.instance;

configureInjection() async {
  getIt.registerFactory<Dio>(() => Dio());

  getIt.registerLazySingleton<StorageRepository>(() => StorageRepositoryImpl(
      dio: getIt<Dio>(), localDataAccess: getIt.get<LocalDataAccess>()));

  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      dio: getIt<Dio>(), localDataAccess: getIt.get<LocalDataAccess>()));

  getIt.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
        dio: getIt<Dio>(),
        localDataAccess: getIt.get<LocalDataAccess>(),
        openIdRepository: getIt.get<OpenIDRepository>()),
  );

  getIt.registerLazySingleton<EventRepository>(() => EventpRepositoryImpl());

  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());

  getIt.registerLazySingleton<OpenIDRepository>(
      () => OpenIDRepositoryImpl(dio: getIt<Dio>()));

  getIt.registerLazySingleton<UtilityRepository>(
      <UtilityRepository>() => UtilitiesRepositoryImpl(dio: getIt<Dio>()));

  final sharedPref = await SharedPreferences.getInstance();
  // getIt.registerSingleton<SharedPreferences>(sharedPref);

  getIt.registerLazySingleton<LocalDataAccess>(
      () => SharePrefHelper(sharedPref: sharedPref));

  // mapper
  getIt.registerLazySingleton<UserDataMapper>(() => UserDataMapper());

  // bloc
  getIt.registerSingleton<CommonCubit>(CommonCubit());
  getIt.registerSingleton<UserCubit>(UserCubit());
  getIt.registerSingleton<EventCubit>(EventCubit());
}
