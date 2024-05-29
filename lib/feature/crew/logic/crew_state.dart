import 'package:freezed_annotation/freezed_annotation.dart';

part 'crew_state.freezed.dart';

@Freezed()
class CrewState with _$CrewState {
  const factory CrewState.loading() = _Loading;
  const factory CrewState.success() = _Success;
  const factory CrewState.error({required String message}) = _Error;
}
