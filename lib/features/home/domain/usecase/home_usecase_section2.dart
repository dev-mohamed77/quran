import 'package:dartz/dartz.dart';

import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/features/home/domain/entities/home_entities.dart';
import 'package:quran/features/home/domain/repositories/home_repositories.dart';

class HomeUsecase {
  final HomeRepositories repo;

  HomeUsecase({
    required this.repo,
  });

  Either<Failure, HomeEntities> call() {
    return repo.getHomeData();
  }
}
