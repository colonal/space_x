import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repositories/ships_repositories.dart';
import 'ships_state.dart';

class ShipsCubit extends Cubit<ShipsState> {
  final ShipsRepositories _shipsRepositories;
  ShipsCubit({required ShipsRepositories repositories})
      : _shipsRepositories = repositories,
        super(const ShipsState.loading());

  factory ShipsCubit.get(context) => BlocProvider.of<ShipsCubit>(context);

  void emitShipsState() async {
    emit(const ShipsState.loading());
    final response = await _shipsRepositories.crew();
    response.when(
      success: (response) {
        emit(ShipsState.success(response));
      },
      failure: (error) {
        emit(ShipsState.error(message: error.apiErrorModel.message ?? ""));
      },
    );
  }
}
