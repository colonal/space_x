import 'package:freezed_annotation/freezed_annotation.dart';

part 'topics_state.freezed.dart';

@Freezed()
class TopicsState with _$TopicsState {
  factory TopicsState.initial() = _Initial;
  factory TopicsState.navigate(String location) = _Navigate;
}
