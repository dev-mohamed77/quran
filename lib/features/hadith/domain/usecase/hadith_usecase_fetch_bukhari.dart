import 'package:dartz/dartz.dart';
import 'package:quran/features/hadith/domain/entities/hadith_entities.dart';

import '../../../../core/error_handler/failure/failure.dart';
import '../repositories/repositories.dart';

class HadithUseCaseFetchHadithBukhari {
  final HadithRepositories repo;
  HadithUseCaseFetchHadithBukhari({
    required this.repo,
  });

  Future<Either<Failure, List<HadithEntities>>> call() async {
    return await repo.fetchHadithBukhari();
  }
}
