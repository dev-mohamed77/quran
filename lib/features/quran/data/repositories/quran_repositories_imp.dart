import 'package:dartz/dartz.dart';

import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/quran/data/data_source/quran_local_data_source.dart';
import 'package:quran/features/quran/domain/entities/quran_entities.dart';
import 'package:quran/features/quran/domain/repositories/repositories.dart';

class QuranRepositoriesImp extends QuranRepositories {
  final QuranLocalDataSource localDataSource;
  QuranRepositoriesImp({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<SurahEntities>>> fetchSurah() async {
    try {
      var _res = await localDataSource.fetchSurah();

      return Right(_res);
    } catch (err) {
      return Left(LocalFailure(localMessage: StringsManager.tryAgain));
    }
  }
}
