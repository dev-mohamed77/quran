import 'package:dartz/dartz.dart';
import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/features/azkar/domain/entities/azkar_entities.dart';

abstract class AzkarRepositories {
  Future<Either<Failure, List<AzkarEntities>>> fetchAzkar();
  // Future<Either<Failure, List<AzkarEntities>>> fetchDoaa();
}
