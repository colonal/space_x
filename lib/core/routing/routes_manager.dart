import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:space_x/core/extensions/mapper.dart';
import 'package:space_x/feature/capsules/logic/cubit/capsules_cubit.dart';
import 'package:space_x/feature/capsules/presentation/capsules_view.dart';

import '../../feature/company/logic/company_cubit.dart';
import '../../feature/company/presentation/screen/company_screen.dart';
import '../../feature/crew/logic/crew_cubit.dart';
import '../../feature/crew/presentation/screen/crew_screen.dart';
import '../../feature/home/data/model/rockets_response.dart';
import '../../feature/home/logic/rockets/rockets_cubit.dart';
import '../../feature/home/logic/topics/topics_cubit.dart';
import '../../feature/home/presentation/screen/home_screen.dart';
import '../../feature/launches/logic/launches_cubit.dart';
import '../../feature/launches/presentation/screen/launches_screen.dart';
import '../../feature/onboarding/logic/onboarding_cubit.dart';
import '../../feature/onboarding/presentation/screen/onboarding_screen.dart';
import '../../feature/rockets/logic/rocket_cubit.dart';
import '../../feature/rockets/presentation/screen/rocket_screen.dart';
import '../../feature/ships/logic/ships_cubit.dart';
import '../../feature/ships/presentation/screen/ships_screen.dart';
import '../constants/routes_constants.dart';
import '../di/dependency_injection.dart' as di;
import '../helpers/cache_helper.dart';

class RouteGenerator {
  final CacheHelpers _cacheHelpers;
  RouteGenerator(CacheHelpers cacheHelpers) : _cacheHelpers = cacheHelpers;

  String get initialRoute {
    bool isOnBoardingScreenViewed = _cacheHelpers.isOnBoardingScreenViewed();

    if (isOnBoardingScreenViewed) {
      return Routes.homeRoute;
    } else {
      return Routes.onboardingRoute;
    }
  }

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<RocketsCubit>(
                create: (_) => di.getIt<RocketsCubit>()..emitRocketsState(),
              ),
              BlocProvider<TopicsCubit>(
                create: (_) => di.getIt<TopicsCubit>(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );

      case Routes.rocketsRoute:
        final rocketsResponse = settings.arguments as RocketsResponse?;
        if (rocketsResponse == null) {
          return unDefinedRoute();
        }
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<RocketCubit>(
                create: (_) => di.getIt<RocketCubit>(),
              ),
            ],
            child: RocketScreen(rocket: rocketsResponse.toRocketModel()),
          ),
        );

      case Routes.capsules:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<CapsulesCubit>(
                create: (_) => di.getIt<CapsulesCubit>()..fetchCapsules(),
              ),
            ],
            child: const CapsulesView(),
          ),
        );

      case Routes.onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => di.getIt<OnboardingCubit>())
            ],
            child: const OnboardingScreen(),
          ),
        );

      case Routes.crewRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) => di.getIt<CrewCubit>()..emitCrewState()),
            ],
            child: const CrewScreen(),
          ),
        );
      case Routes.shipsRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) => di.getIt<ShipsCubit>()..emitShipsState()),
            ],
            child: const ShipsScreen(),
          ),
        );
      case Routes.companyRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) => di.getIt<CompanyCubit>()..emitCompanyState()),
            ],
            child: const CompanyScreen(),
          ),
        );
      case Routes.launchesRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => di.getIt<LaunchesCubit>()..emitLaunchesState(),
              ),
            ],
            child: const LaunchesScreen(),
          ),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text("noRouteFound"),
        ),
      ),
    );
  }
}
