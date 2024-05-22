import 'package:freezed_annotation/freezed_annotation.dart';

part 'rocket_state.freezed.dart';

@Freezed()
class RocketState with _$RocketState {
  const factory RocketState.initial() = _Initial;
  const factory RocketState.changeRocketImage(int index) = ChangeRocketImage;
}
