import "package:flutter_bloc/flutter_bloc.dart";

import '../../../../core/helpers/event_bus.dart';
import '../../data/repositories/home_repositories.dart';
import 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  final HomeRepositories _homeRepositories;
  RocketsCubit({required HomeRepositories homeRepositories})
      : _homeRepositories = homeRepositories,
        super(const RocketsState.loading());

  factory RocketsCubit.get(context) => BlocProvider.of<RocketsCubit>(context);

  void emitRocketsState() async {
    emit(const RocketsState.loading());

    final response = await _homeRepositories.rockets();

    response.when(
      success: (rocketsResponse) {
        emit(RocketsState.success(rocketsResponse));
      },
      failure: (error) {
        emit(RocketsState.error(message: error.apiErrorModel.message ?? ""));
      },
    );
  }

  void onChangeImage(int index) {
    eventBus.fire(ChangeRocketsImage(index));
  }
}
