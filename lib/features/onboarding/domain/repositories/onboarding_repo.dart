import 'package:dartz/dartz.dart';
import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/features/onboarding/domain/entities/onboarding_entities.dart';

abstract class OnboardingRepositories {
  Either<Failure, List<OnboardingEntities>> onboardingListData();
}
