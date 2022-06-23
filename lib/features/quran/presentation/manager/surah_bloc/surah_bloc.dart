import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quran/features/quran/domain/entities/quran_entities.dart';
import 'package:quran/features/quran/presentation/manager/surah_bloc/surah_state.dart';

part 'surah_event.dart';

class SelectSurahBloc extends Bloc<SelectedSurahEvent, SelectedSurahState> {
  SelectSurahBloc() : super(SelectedSurahInit()) {
    on<SelectSurah>((event, emit) {
      emit(SurahState(surah: event.surah));
    });
  }
}
