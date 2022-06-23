import 'package:dartz/dartz.dart';

import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/azkar/data/data_source/azkar_local_data_source.dart';
import 'package:quran/features/azkar/domain/entities/azkar_entities.dart';
import 'package:quran/features/azkar/domain/repositories/repositories.dart';

import '../model/azkar_model.dart';

class AzkarRepositoriesImp implements AzkarRepositories {
  final AzkarLocalDataSource azkarLocalDataSource;

  AzkarRepositoriesImp({
    required this.azkarLocalDataSource,
  });
  @override
  Future<Either<Failure, List<AzkarEntities>>> fetchAzkar() async {
    try {
      List<AzkarModel> _res = await azkarLocalDataSource.fetchAzkar();

      return Right(_res);
    } catch (err) {
      return Left(LocalFailure(localMessage: StringsManager.tryAgain));
    }
  }
}
