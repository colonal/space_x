import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/rockets_response.dart';

part 'rockets_state.freezed.dart';

@Freezed()
class RocketsState with _$RocketsState {
  const factory RocketsState.loading() = Loading;
  const factory RocketsState.success(List<RocketsResponse> data) = Success;
  const factory RocketsState.error({required String message}) = Error;
}
