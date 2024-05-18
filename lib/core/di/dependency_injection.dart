import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/home/data/data_sources/home_data_sources.dart';
import '../../feature/home/data/repositories/home_repositories.dart';
import '../../feature/home/logic/rockets/rockets_cubit.dart';
import '../../feature/rockets/logic/rocket_cubit.dart';
import '../helpers/cache_helper.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // Cache Helpers
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<CacheHelpers>(
      () => CacheHelpers(sharedPreferences: getIt()));

  // Home
  getIt.registerLazySingleton<HomeRemoteDataSources>(
      () => HomeRemoteDataSources(getIt()));

  getIt.registerLazySingleton<HomeRepositories>(
      () => HomeRepositories(homeRemoteDataSources: getIt()));
  getIt.registerFactory<RocketsCubit>(
      () => RocketsCubit(homeRepositories: getIt()));

  // Rocket
  getIt.registerFactory<RocketCubit>(() => RocketCubit());
}
