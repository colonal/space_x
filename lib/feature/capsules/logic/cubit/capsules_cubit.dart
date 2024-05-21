import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/feature/capsules/data/repo/capsules_repo.dart';
import 'package:space_x/feature/capsules/logic/cubit/capsules_state.dart';

class CapsulesCubit extends Cubit<CapsulesState> {
  final CapsulesRepo _capsulesRepo;
  
  CapsulesCubit(this._capsulesRepo) : super(const Initial());

  factory CapsulesCubit.get(context) => BlocProvider.of<CapsulesCubit>(context);

  

  Future<void> fetchCapsules() async {
    emit(const CapsulesState.loading());
    try {
      final result = await _capsulesRepo.fetchCapsules();

      result.when(
        success: (capsules) {
          emit(CapsulesState.success(capsules));
        },
        failure: (handler) {
          final errorMessage =
              handler.apiErrorModel.message ?? 'Unknown error ';
          emit(CapsulesState.error(error: errorMessage));
        },
      );
    } catch (e) {
      emit(CapsulesState.error(error: 'An unexpected error : $e'));
    }
  }
}
