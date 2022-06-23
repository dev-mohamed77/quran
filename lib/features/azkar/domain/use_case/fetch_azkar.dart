import 'package:dartz/dartz.dart';
import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/features/azkar/domain/entities/azkar_entities.dart';
import 'package:quran/features/azkar/domain/repositories/repositories.dart';

class UseCaseFetchAzkar {
  final AzkarRepositories repo;
  UseCaseFetchAzkar({required this.repo});

  Future<Either<Failure, List<AzkarEntities>>> call() async {
    return await repo.fetchAzkar();
  }
}
