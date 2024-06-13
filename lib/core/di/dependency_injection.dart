import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x/feature/capsules/data/repo/capsules_repo.dart';
import 'package:space_x/feature/capsules/logic/cubit/capsules_cubit.dart';
import 'package:space_x/feature/crew/data/data_sources/crew_data_sources.dart';
import 'package:space_x/feature/crew/data/repositories/crew_repositories.dart';
import 'package:space_x/feature/crew/logic/crew_cubit.dart';

import '../../feature/company/data/data_sources/company_data_sources.dart';
import '../../feature/company/data/repositories/company_repository.dart';
import '../../feature/company/logic/company_cubit.dart';
import '../../feature/home/data/data_sources/home_data_sources.dart';
import '../../feature/home/data/repositories/home_repositories.dart';
import '../../feature/home/logic/rockets/rockets_cubit.dart';
import '../../feature/home/logic/topics/topics_cubit.dart';
import '../../feature/launches/data/data_sources/launches_data_sources.dart';
import '../../feature/launches/data/repositories/launches_repositories.dart';
import '../../feature/launches/logic/launches_cubit.dart';
import '../../feature/onboarding/logic/onboarding_cubit.dart';
import '../../feature/rockets/logic/rocket_cubit.dart';
import '../helpers/cache_helper.dart';
import '../networking/dio_factory.dart';
import '../routing/routes_manager.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  // Dio
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // App Info
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  getIt.registerLazySingleton<PackageInfo>(() => packageInfo);

  // Cache Helpers
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<CacheHelpers>(
      () => CacheHelpers(sharedPreferences: getIt()));

  // RouteGenerator
  getIt.registerLazySingleton<RouteGenerator>(() => RouteGenerator(getIt()));

  // Home
  getIt.registerLazySingleton<HomeRemoteDataSources>(
      () => HomeRemoteDataSources(getIt()));

  getIt.registerLazySingleton<HomeRepositories>(
      () => HomeRepositories(homeRemoteDataSources: getIt()));
  getIt.registerFactory<RocketsCubit>(
      () => RocketsCubit(homeRepositories: getIt()));
  getIt.registerFactory<TopicsCubit>(() => TopicsCubit());

  // capssules
  getIt.registerLazySingleton<CapsulesRepo>(
      () => CapsulesRepo(homeRemoteDataSources: getIt()));
  getIt.registerFactory<CapsulesCubit>(() => CapsulesCubit(getIt()));

  // Rocket
  getIt.registerFactory<RocketCubit>(() => RocketCubit());

  // Onboarding
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit(getIt()));

  // crew
  getIt.registerLazySingleton<CrewRemoteDataSources>(
      () => CrewRemoteDataSources(getIt()));
  getIt.registerLazySingleton<CrewRepositories>(
      () => CrewRepositories(crewRemoteDataSources: getIt()));
  getIt.registerFactory<CrewCubit>(() => CrewCubit(repositories: getIt()));

  // Company
  getIt.registerLazySingleton<CompanyRemoteDataSources>(
      () => CompanyRemoteDataSources(getIt()));
  getIt.registerLazySingleton<CompanyRepository>(
      () => CompanyRepository(dataSources: getIt()));
  getIt.registerFactory<CompanyCubit>(
      () => CompanyCubit(repository: getIt(), packageInfo: getIt()));

  // Launches
  getIt.registerLazySingleton<LaunchesDataSources>(
      () => LaunchesDataSources(getIt()));
  getIt.registerLazySingleton<LaunchesRepositories>(
      () => LaunchesRepositories(dataSources: getIt()));
  getIt
      .registerFactory<LaunchesCubit>(() => LaunchesCubit(repository: getIt()));
}
