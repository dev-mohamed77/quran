import 'package:dartz/dartz.dart';
import 'package:quran/features/hadith/domain/entities/hadith_entities.dart';

import '../../../../core/error_handler/failure/failure.dart';

abstract class HadithRepositories {
  Future<Either<Failure, List<HadithEntities>>> fetchHadithBukhari();
  Future<Either<Failure, List<HadithEntities>>> fetchHadithIbnMaja();
  Future<Either<Failure, List<HadithEntities>>> fetchHadithMalik();
  Future<Either<Failure, List<HadithEntities>>> fetchHadithMuslim();
  Future<Either<Failure, List<HadithEntities>>> fetchHadithNasai();
  Future<Either<Failure, List<HadithEntities>>> fetchHadithTrmizi();
}
