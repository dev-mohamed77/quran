import 'package:equatable/equatable.dart';

class AudioManagerState extends Equatable {
  Duration allTimeAudio;
  Duration positionAudio;
  final bool isPlay;

  AudioManagerState({
    required this.allTimeAudio,
    required this.positionAudio,
    required this.isPlay,
  });

  @override
  List<Object> get props => [
        allTimeAudio,
        positionAudio,
        isPlay,
      ];
}
