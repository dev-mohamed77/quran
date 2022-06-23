import 'package:dartz/dartz.dart';
import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/features/audios/domain/entities/audio_entities.dart';

abstract class AudioRepositories {
  Future<Either<Failure, List<AudioEntities>>> fetchAudio();
}
