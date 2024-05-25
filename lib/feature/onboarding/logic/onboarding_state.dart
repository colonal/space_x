import 'package:freezed_annotation/freezed_annotation.dart';
part 'onboarding_state.freezed.dart';

@Freezed()
class OnboardingState with _$OnboardingState {
  // initial
  const factory OnboardingState.initial() = _Initial;
  const factory OnboardingState.navigateToHome() = _NavigateToHome;
}
