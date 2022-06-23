import 'package:dartz/dartz.dart';

import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/features/onboarding/domain/entities/onboarding_entities.dart';
import 'package:quran/features/onboarding/domain/repositories/onboarding_repo.dart';

class OnboardingUsecase {
  final OnboardingRepositories repo;

  OnboardingUsecase({
    required this.repo,
  });

  Either<Failure, List<OnboardingEntities>> call() {
    return repo.onboardingListData();
  }
}
