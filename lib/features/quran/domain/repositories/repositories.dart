import 'package:dartz/dartz.dart';
import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/features/quran/domain/entities/quran_entities.dart';

abstract class QuranRepositories {
  Future<Either<Failure, List<SurahEntities>>> fetchSurah();
}
