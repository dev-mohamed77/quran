// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/audios/data/data_source/audio_data_source_remote.dart';
import 'package:quran/features/audios/domain/entities/audio_entities.dart';
import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:quran/features/audios/domain/repositories/audio_repositories.dart';

class AudioRepositoriesImp extends AudioRepositories {
  final AudioDataSourceRemote remoteDataSource;

  AudioRepositoriesImp({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<AudioEntities>>> fetchAudio() async {
    try {
      var _res = await remoteDataSource.fetchAudio();

      return Right(_res);
    } catch (err) {
      return Left(
        NetworkFailure(netWorkMessage: StringsManager.tryAgain),
      );
    }
  }
}
