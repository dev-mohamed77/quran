part of '../surah_bloc/surah_bloc.dart';

abstract class SelectedSurahEvent extends Equatable {}

class SelectSurah extends SelectedSurahEvent {
  final SurahEntities surah;

  SelectSurah({
    required this.surah,
  });
  @override
  List<Object?> get props => [surah];
}
