part of 'onboardingbloc_bloc.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.initial() = _Initial;
  const factory OnboardingState.success(List<OnboardingEntities> data) =
      _Success;
  const factory OnboardingState.error(String message) = _Error;
}
