import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/audios/presentation/manager/audio_the_reader_and_sura_name_bloc/event.dart';
import 'package:quran/features/audios/presentation/manager/audio_the_reader_and_sura_name_bloc/state.dart';

class AudioTheReaderAndSurahNameBloc extends Bloc<
    AudioTheReaderAndSurahNameEvent, AudioTheReaderAndSurahNameState> {
  AudioTheReaderAndSurahNameBloc()
      : super(const AudioTheReaderAndSurahNameState(
            surahName: '', theReader: '')) {
    on<AudioTheReaderAndSurahName>((event, emit) {
      emit(AudioTheReaderAndSurahNameState(
        theReader: event.theReader,
        surahName: event.surahName,
      ));
    });
  }
}
