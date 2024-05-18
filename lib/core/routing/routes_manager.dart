import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/home/data/model/rockets_response.dart';
import '../../feature/home/logic/rockets/rockets_cubit.dart';
import '../../feature/home/presentation/screen/home_screen.dart';
import '../../feature/rockets/data/model/rocket_model.dart';
import '../../feature/rockets/logic/rocket_cubit.dart';
import '../../feature/rockets/presentation/screen/rocket_screen.dart';
import '../constants/routes_constants.dart';
import '../di/dependency_injection.dart' as di;

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<RocketsCubit>(
                create: (_) => di.getIt<RocketsCubit>()..emitRocketsState(),
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
        final rocketModel = RocketModel.fromJson(rocketsResponse.toJson());
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<RocketCubit>(
                create: (_) => di.getIt<RocketCubit>(),
              ),
            ],
            child: RocketScreen(rocket: rocketModel),
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
