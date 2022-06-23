import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran/features/quran/domain/usecase/quran_usecase_fetch_surah.dart';
import 'package:quran/features/quran/presentation/manager/quran_bloc/event.dart';
import 'package:quran/features/quran/presentation/manager/quran_bloc/state.dart';

class FetchQuranBloc extends Bloc<QuranEvent, QuranState> {
  final QuranUsecaseFetchSurah usecaseFetchSurahs;

  FetchQuranBloc({
    required this.usecaseFetchSurahs,
  }) : super(QuranStateInitial()) {
    on<QuranEventStart>((event, emit) async {
      emit(QuranStateLoading());
      // await Future.delayed(const Duration(milliseconds: 200));
      (await usecaseFetchSurahs.call()).fold(
        (fail) {
          emit(QuranStateError(error: fail.message));
        },
        (data) {
          emit(QuranStateLoaded(data: data));
        },
      );
    });
  }

  String typeSurah(String type) {
    String _name;
    if (type == "Medinan") {
      _name = "مدنية";
    } else {
      _name = "مكية";
    }
    return _name;
  }

  String surahCount(int count) {
    String _aya;
    if (count >= 10) {
      _aya = "$count أية";
    } else {
      _aya = "$count أيات";
    }
    return _aya;
  }
}
