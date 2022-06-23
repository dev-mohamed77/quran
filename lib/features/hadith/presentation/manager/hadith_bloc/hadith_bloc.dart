import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran/features/hadith/domain/usecase/hadith_usecase_fetch_bukhari.dart';
import 'package:quran/features/hadith/domain/usecase/hadith_usecase_fetch_ibn_maja.dart';
import 'package:quran/features/hadith/domain/usecase/hadith_usecase_fetch_malik.dart';
import 'package:quran/features/hadith/domain/usecase/hadith_usecase_fetch_muslim.dart';
import 'package:quran/features/hadith/domain/usecase/hadith_usecase_fetch_nasai.dart';
import 'package:quran/features/hadith/domain/usecase/hadith_usecase_fetch_trmizi.dart';
import 'package:quran/features/hadith/presentation/manager/hadith_bloc/hadith_event.dart';
import 'package:quran/features/hadith/presentation/manager/hadith_bloc/hadith_state.dart';

import '../../../../../core/utils/strings_manager.dart';
import '../../../domain/entities/hadith_entities.dart';

class HadithBloc extends Bloc<HadithEvent, HadithState> {
  final HadithUseCaseFetchHadithBukhari fetchHadithBukhari;
  final HadithUseCaseFetchHadithIbnMaja fetchHadithIbnMaja;
  final HadithUseCaseFetchHadithMalik fetchHadithMalik;
  final HadithUseCaseFetchHadithMuslim fetchHadithMuslim;
  final HadithUseCaseFetchHadithNasai fetchHadithNasai;
  final HadithUseCaseFetchHadithTrmizi fetchHadithTrmizi;

  HadithBloc({
    required this.fetchHadithBukhari,
    required this.fetchHadithIbnMaja,
    required this.fetchHadithMalik,
    required this.fetchHadithMuslim,
    required this.fetchHadithNasai,
    required this.fetchHadithTrmizi,
  }) : super(HadithStateLoading()) {
    on<FetchHadithBukhari>((event, emit) async {
      (await fetchHadithBukhari.call()).fold(
        (fail) {
          emit(HadithStateError(error: fail.message));
        },
        (data) {
          hadithData.addAll(data);
          emit(HadithStateLoaded(data: data));
        },
      );
    });
    on<FetchHadithIbnMaja>((event, emit) async {
      (await fetchHadithIbnMaja.call()).fold(
        (fail) {
          emit(HadithStateError(error: fail.message));
        },
        (data) {
          hadithData.addAll(data);
          emit(HadithStateLoaded(data: data));
        },
      );
    });
    on<FetchHadithMalik>((event, emit) async {
      (await fetchHadithMalik.call()).fold(
        (fail) {
          emit(HadithStateError(error: fail.message));
        },
        (data) {
          hadithData.addAll(data);
          emit(HadithStateLoaded(data: data));
        },
      );
    });
    on<FetchHadithMuslim>((event, emit) async {
      (await fetchHadithMuslim.call()).fold(
        (fail) {
          emit(HadithStateError(error: fail.message));
        },
        (data) {
          hadithData.addAll(data);
          emit(HadithStateLoaded(data: data));
        },
      );
    });
    on<FetchHadithNasai>((event, emit) async {
      (await fetchHadithNasai.call()).fold(
        (fail) {
          emit(HadithStateError(error: fail.message));
        },
        (data) {
          hadithData.addAll(data);
          emit(HadithStateLoaded(data: data));
        },
      );
    });
    on<FetchHadithTrmizi>((event, emit) async {
      (await fetchHadithTrmizi.call()).fold(
        (fail) {
          emit(HadithStateError(error: fail.message));
        },
        (data) {
          hadithData.addAll(data);
          emit(HadithStateLoaded(data: data));
        },
      );
    });
    on<SearchAndFilterHadith>((event, emit) async {
      var _state = state;
      if (_state is HadithStateLoaded) {
        emit(HadithStateLoading());

        if (event.title.isEmpty) {
          emit(HadithStateLoaded(data: hadithData));
        } else {
          var _filterList = _state.data.where((hadith) {
            String _hadithTitle = hadith.searchTerm.toLowerCase();
            String _input = event.title.toLowerCase();
            return _hadithTitle.contains(_input);
          }).toList();

          emit(HadithStateLoaded(data: _filterList));
        }
      }
    });
  }

  final List<HadithEntities> hadithData = [];

  final List<String> categoryList = [
    StringsManager.bukhari,
    StringsManager.ibnMaja,
    StringsManager.malik,
    StringsManager.nasai,
    StringsManager.trmizi,
  ];
}
