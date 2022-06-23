import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quran/features/onboarding/domain/entities/onboarding_entities.dart';
import 'package:quran/features/onboarding/domain/usecase/onboarding_usecase.dart';

part 'onboardingbloc_bloc.freezed.dart';
part 'onboardingbloc_event.dart';
part 'onboardingbloc_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardingUsecase onboardingUsecase;
  OnboardingBloc({
    required this.onboardingUsecase,
  }) : super(const _Initial()) {
    on<OnboardingEvent>((event, emit) {
      emit(const OnboardingState.initial());

      (onboardingUsecase.call()).fold((fail) {
        emit(OnboardingState.error(fail.message));
      }, (data) {
        emit(OnboardingState.success(data));
      });
    });
  }

  bool isChangeButtonColor = false;
}
