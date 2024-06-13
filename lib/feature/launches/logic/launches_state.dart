part of 'launches_cubit.dart';

@freezed
class LaunchesState with _$LaunchesState {
  const factory LaunchesState.loading() = _Loading;
  const factory LaunchesState.success() = _Success;
  const factory LaunchesState.error({required String message}) = _Error;
}
