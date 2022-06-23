import 'package:equatable/equatable.dart';
import 'package:quran/features/quran/domain/entities/quran_entities.dart';

abstract class SelectedSurahState extends Equatable {}

class SelectedSurahInit extends SelectedSurahState {
  @override
  List<Object?> get props => [];
}

class SurahState extends SelectedSurahState {
  final SurahEntities surah;

  SurahState({
    required this.surah,
  });

  @override
  List<Object> get props => [surah];
}
