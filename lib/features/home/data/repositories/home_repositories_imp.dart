import 'package:dartz/dartz.dart';

import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/home/data/data_source/home_local_data_source.dart';
import 'package:quran/features/home/domain/entities/home_entities.dart';
import 'package:quran/features/home/domain/repositories/home_repositories.dart';

class HomeRepositoriesImp extends HomeRepositories {
  final HomeLocalDataSource localDataSource;

  HomeRepositoriesImp({
    required this.localDataSource,
  });

  @override
  Either<Failure, HomeEntities> getHomeData() {
    try {
      var _res = localDataSource.getHomeData();
      return Right(_res);
    } catch (err) {
      return left(LocalFailure(localMessage: StringsManager.tryAgain));
    }
  }
}
