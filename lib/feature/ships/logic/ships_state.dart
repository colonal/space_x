import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/model/ships_model.dart';

part 'ships_state.freezed.dart';

@freezed
class ShipsState with _$ShipsState {
  const factory ShipsState.loading() = _Loading;
  const factory ShipsState.success(List<ShipsModel> data) = _Success;
  const factory ShipsState.error({required String message}) = _Error;
}
