import 'package:dartz/dartz.dart';
import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/features/quran/domain/entities/quran_entities.dart';
import 'package:quran/features/quran/domain/repositories/repositories.dart';

class QuranUsecaseFetchSurah {
  final QuranRepositories repo;

  QuranUsecaseFetchSurah({
    required this.repo,
  });

  Future<Either<Failure, List<SurahEntities>>> call() async {
    return await repo.fetchSurah();
  }
}
