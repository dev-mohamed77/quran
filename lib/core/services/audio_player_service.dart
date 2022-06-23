import 'package:audioplayers/audioplayers.dart';
import 'package:rxdart/subjects.dart';

class AudioPlayerService {
  final BehaviorSubject onAudioPositionChangedCustom = BehaviorSubject();

  final BehaviorSubject onDurationChangedCustom = BehaviorSubject();

  late final AudioPlayer _audioPlayer;

  AudioPlayerService._() {
    _audioPlayer = AudioPlayer();

    _audioPlayer.onDurationChanged.listen((event) {
      onDurationChangedCustom.add(event);
    });
    _audioPlayer.onAudioPositionChanged.listen((event) {
      onAudioPositionChangedCustom.add(event);
    });
  }

  factory AudioPlayerService() => AudioPlayerService._();

  Future<void> play(String url) async {
    await _audioPlayer.play(url);
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> resume() async {
    await _audioPlayer.resume();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  Future<void> seek(Duration seconds) async {
    await _audioPlayer.seek(seconds);
  }

  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }
}
