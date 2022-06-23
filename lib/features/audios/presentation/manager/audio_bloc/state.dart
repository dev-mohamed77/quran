import 'package:equatable/equatable.dart';

import 'package:quran/features/audios/domain/entities/audio_entities.dart';

abstract class AudioState extends Equatable {}

class AudioLoadingState extends AudioState {
  @override
  List<Object?> get props => [];
}

class AudioLoadedState extends AudioState {
  final List<AudioEntities> data;
  AudioLoadedState({
    required this.data,
  });
  @override
  List<Object?> get props => [data];
}

class AudioErrorState extends AudioState {
  final String fail;
  AudioErrorState({
    required this.fail,
  });
  @override
  List<Object?> get props => [fail];
}

class AudioNoInternetState extends AudioState {
  @override
  List<Object?> get props => [];
}
