import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rocket_state.dart';

class RocketCubit extends Cubit<RocketState> {
  RocketCubit() : super(const RocketState.initial());

  factory RocketCubit.get(context) => BlocProvider.of<RocketCubit>(context);

  int courantImageIndex = 0;
  PageController pageImageController = PageController();
  void onChangeRocketImage(int index) {
    courantImageIndex = index;
    emit(RocketState.changeRocketImage(index));
  }

  @override
  Future<void> close() {
    pageImageController.dispose();
    return super.close();
  }
}
