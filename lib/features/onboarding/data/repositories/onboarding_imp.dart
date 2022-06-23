import 'package:dartz/dartz.dart';

import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/onboarding/data/data_source/onboarding_loacal_data_source.dart';
import 'package:quran/features/onboarding/domain/entities/onboarding_entities.dart';
import 'package:quran/features/onboarding/domain/repositories/onboarding_repo.dart';

class OnboardingRepositoriesImp extends OnboardingRepositories {
  final OnboardingLocalDataSource localDataSource;

  OnboardingRepositoriesImp({
    required this.localDataSource,
  });

  @override
  Either<Failure, List<OnboardingEntities>> onboardingListData() {
    try {
      var _res = localDataSource.onboardingData();
      return Right(_res);
    } catch (err) {
      return Left(LocalFailure(localMessage: StringsManager.tryAgain));
    }
  }
}
