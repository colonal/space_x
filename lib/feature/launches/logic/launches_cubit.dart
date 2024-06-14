import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/launches.dart';
import '../data/repositories/launches_repositories.dart';

part 'launches_state.dart';
part 'launches_cubit.freezed.dart';

class LaunchesCubit extends Cubit<LaunchesState> {
  final LaunchesRepositories _repository;
  LaunchesCubit({required LaunchesRepositories repository})
      : _repository = repository,
        super(const LaunchesState.loading());

  factory LaunchesCubit.get(context) => BlocProvider.of<LaunchesCubit>(context);

  List<Launches> launches = [];

  void emitLaunchesState() async {
    emit(const LaunchesState.loading());

    final response = await _repository.launches();

    response.when(
      success: (response) {
        launches = response;
        emit(LaunchesState.success());
      },
      failure: (error) {
        emit(LaunchesState.error(message: error.apiErrorModel.message ?? ""));
      },
    );
  }

  int getTotalLaunches() {
    return launches.length;
  }

  int getTotalLandings() {
    return launches.where((element) => element.success ?? false).length;
  }

  int getTotalFailures() {
    return launches
        .where((element) => element.success != null
            ? element.success == false
                ? true
                : false
            : true)
        .length;
  }
}
