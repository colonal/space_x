import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/feature/crew/data/repositories/crew_repositories.dart';

import '../data/model/crew_model.dart';
import 'crew_state.dart';

class CrewCubit extends Cubit<CrewState> {
  final CrewRepositories _repositories;

  CrewCubit({required CrewRepositories repositories})
      : _repositories = repositories,
        super(const CrewState.loading());

  factory CrewCubit.get(context) => BlocProvider.of<CrewCubit>(context);

  List<CrewModel> crews = [];

  void emitCrewState() async {
    emit(const CrewState.loading());

    final response = await _repositories.crew();

    response.when(
      success: (response) {
        crews = response;
        emit(const CrewState.success());
      },
      failure: (error) {
        emit(CrewState.error(message: error.apiErrorModel.message ?? ""));
      },
    );
  }
}
