import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/services/audio_player_service.dart';
import 'package:quran/features/audios/presentation/manager/audio_manager_bloc/event.dart';
import 'package:quran/features/audios/presentation/manager/audio_manager_bloc/state.dart';

class AudioManagerBloc extends Bloc<AudioManagerEvent, AudioManagerState> {
  final AudioPlayerService audioPlayerService;

  AudioManagerBloc({
    required this.audioPlayerService,
  }) : super(
          AudioManagerState(
            allTimeAudio: Duration.zero,
            positionAudio: Duration.zero,
            isPlay: false,
          ),
        ) {
    audioPlayerService.onAudioPositionChangedCustom.listen((event) {
      emit(
        AudioManagerState(
          allTimeAudio: state.allTimeAudio,
          isPlay: state.isPlay,
          positionAudio: event,
        ),
      );
    });

    audioPlayerService.onDurationChangedCustom.listen((event) {
      emit(
        AudioManagerState(
          allTimeAudio: event,
          isPlay: state.isPlay,
          positionAudio: state.positionAudio,
        ),
      );
    });

    on<AudioManagerIsPlay>((event, emit) {
      emit(AudioManagerState(
        allTimeAudio: state.allTimeAudio,
        positionAudio: state.positionAudio,
        isPlay: event.isPlay,
      ));
    });

    on<AudioManagerPlay>(((event, emit) async {
      try {
        await audioPlayerService.play(event.url);
        emit(AudioManagerState(
          allTimeAudio: state.allTimeAudio,
          positionAudio: state.positionAudio,
          isPlay: true,
        ));
      } catch (err) {
        print(err);
      }
    }));
    on<AudioManagerPause>(((event, emit) async {
      try {
        await audioPlayerService.pause();
        emit(AudioManagerState(
          allTimeAudio: state.allTimeAudio,
          positionAudio: state.positionAudio,
          isPlay: false,
        ));
      } catch (err) {
        print(err);
      }
    }));

    on<AudioManagerResume>((event, emit) async {
      await audioPlayerService.resume();
      emit(AudioManagerState(
        allTimeAudio: state.allTimeAudio,
        positionAudio: state.positionAudio,
        isPlay: true,
      ));
    });

    on<AudioManagerSeek>((event, emit) async {
      await audioPlayerService.seek(event.position);
      emit(AudioManagerState(
        allTimeAudio: state.allTimeAudio,
        positionAudio: event.position,
        isPlay: state.isPlay,
      ));
    });

    on<AudioManagerStop>(((event, emit) async {
      try {
        await audioPlayerService.stop();
        emit(AudioManagerState(
          allTimeAudio: state.allTimeAudio,
          positionAudio: state.positionAudio,
          isPlay: false,
        ));
      } catch (err) {
        print(err);
      }
    }));
    on<AudioManagerDispose>(((event, emit) async {
      try {
        await audioPlayerService.dispose();
        emit(AudioManagerState(
          allTimeAudio: state.allTimeAudio,
          positionAudio: state.positionAudio,
          isPlay: false,
        ));
      } catch (err) {
        print(err);
      }
    }));
  }
  String quranUrl(String id) {
    var idConvert = int.parse(id);

    String urlServer = "";

    if (idConvert <= 9) {
      urlServer = "00$id.mp3";
    } else if (idConvert > 9 && idConvert <= 99) {
      urlServer = "0$id.mp3";
    } else if (idConvert > 99 && idConvert <= 114) {
      urlServer = "$id.mp3";
    }

    return urlServer;
  }
}
