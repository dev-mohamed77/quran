import 'package:equatable/equatable.dart';

abstract class AudioManagerEvent extends Equatable {}

class AudioManagerIsPlay extends AudioManagerEvent {
  bool isPlay;
  AudioManagerIsPlay({
    required this.isPlay,
  });

  @override
  List<Object?> get props => [isPlay];
}

class AudioManagerPlay extends AudioManagerEvent {
  final String url;

  AudioManagerPlay({required this.url});

  @override
  List<Object?> get props => [url];
}

class AudioManagerPause extends AudioManagerEvent {
  AudioManagerPause();

  @override
  List<Object?> get props => [];
}

class AudioManagerResume extends AudioManagerEvent {
  AudioManagerResume();

  @override
  List<Object?> get props => [];
}

class AudioManagerStop extends AudioManagerEvent {
  AudioManagerStop();

  @override
  List<Object?> get props => [];
}

class AudioManagerSeek extends AudioManagerEvent {
  final Duration position;

  AudioManagerSeek({
    required this.position,
  });

  @override
  List<Object?> get props => [position];
}

class AudioManagerDispose extends AudioManagerEvent {
  AudioManagerDispose();

  @override
  List<Object?> get props => [];
}
