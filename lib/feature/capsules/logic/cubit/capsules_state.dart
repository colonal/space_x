import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:space_x/feature/capsules/data/model/capsule.dart';

part 'capsules_state.freezed.dart';

@freezed
class CapsulesState with _$CapsulesState {
  const factory CapsulesState.error({required String error}) = Error;

  const factory CapsulesState.initial() = Initial;

  const factory CapsulesState.loading() = Loading;

  const factory CapsulesState.success(List<Capsule> data) = Success;
}
