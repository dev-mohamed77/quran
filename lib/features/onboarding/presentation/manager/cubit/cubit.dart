import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/onboarding/presentation/manager/cubit/state.dart';

class OnboardingCubit extends Cubit<OnboardingCubitState> {
  OnboardingCubit() : super(OnboardingCubitStateInitial());

  int count = 1;

  void changeButton(int count) {
    if (count >= 2) {
      emit(OnboardingCubitChangeOneButton());
    } else {
      emit(OnboardingCubitChangeTwoButton());
    }
  }

  void changeButtonNextColor(bool value) {
    if (value) {
      emit(OnboardingCubitChangeButtonColorNext());
    } else {
      emit(OnboardingCubitChangeButtonColor());
    }
  }

  void changeButtonPrevColor(bool value) {
    if (value) {
      emit(OnboardingCubitChangeButtonColorPrev());
    } else {
      emit(OnboardingCubitChangeButtonColor());
    }
  }
}
