import 'package:dartz/dartz.dart';

import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/hadith/data/data_source/hadith_local_data_source.dart';
import 'package:quran/features/hadith/domain/entities/hadith_entities.dart';
import 'package:quran/features/hadith/domain/repositories/repositories.dart';

import '../model/hadith_model.dart';

class HadithRepositoriesImp implements HadithRepositories {
  final HadithLocaLDataSource dataSource;

  HadithRepositoriesImp({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<HadithEntities>>> fetchHadithBukhari() async {
    try {
      List<HadithModel> _response = await dataSource.fetchHadithBukhari();
      return Right(_response);
    } catch (err) {
      return Left(LocalFailure(localMessage: StringsManager.tryAgain));
    }
  }

  @override
  Future<Either<Failure, List<HadithEntities>>> fetchHadithIbnMaja() async {
    try {
      List<HadithModel> _response = await dataSource.fetchHadithIbnMaja();
      return Right(_response);
    } catch (err) {
      return Left(LocalFailure(localMessage: StringsManager.tryAgain));
    }
  }

  @override
  Future<Either<Failure, List<HadithEntities>>> fetchHadithMalik() async {
    try {
      List<HadithModel> _response = await dataSource.fetchHadithMalik();
      return Right(_response);
    } catch (err) {
      return Left(LocalFailure(localMessage: StringsManager.tryAgain));
    }
  }

  @override
  Future<Either<Failure, List<HadithEntities>>> fetchHadithMuslim() async {
    try {
      List<HadithModel> _response = await dataSource.fetchHadithMuslim();
      return Right(_response);
    } catch (err) {
      return Left(LocalFailure(localMessage: StringsManager.tryAgain));
    }
  }

  @override
  Future<Either<Failure, List<HadithEntities>>> fetchHadithNasai() async {
    try {
      List<HadithModel> _response = await dataSource.fetchHadithNasai();
      return Right(_response);
    } catch (err) {
      return Left(LocalFailure(localMessage: StringsManager.tryAgain));
    }
  }

  @override
  Future<Either<Failure, List<HadithEntities>>> fetchHadithTrmizi() async {
    try {
      List<HadithModel> _response = await dataSource.fetchHadithTrmizi();
      return Right(_response);
    } catch (err) {
      return Left(LocalFailure(localMessage: StringsManager.tryAgain));
    }
  }
}
