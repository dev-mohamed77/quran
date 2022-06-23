import 'package:dartz/dartz.dart';
import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/features/home/domain/entities/home_entities.dart';

abstract class HomeRepositories {
  Either<Failure, HomeEntities> getHomeData();
}
