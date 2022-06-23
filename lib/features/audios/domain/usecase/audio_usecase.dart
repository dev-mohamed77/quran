import 'package:dartz/dartz.dart';
import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/features/audios/domain/entities/audio_entities.dart';
import 'package:quran/features/audios/domain/repositories/audio_repositories.dart';

class AudioUseCase {
  final AudioRepositories repo;
  AudioUseCase({
    required this.repo,
  });

  Future<Either<Failure, List<AudioEntities>>> call() async {
    return await repo.fetchAudio();
  }
}
