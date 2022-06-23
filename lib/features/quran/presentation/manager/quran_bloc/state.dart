import 'package:equatable/equatable.dart';

import 'package:quran/features/quran/domain/entities/quran_entities.dart';

abstract class QuranState extends Equatable {}

class QuranStateInitial extends QuranState {
  @override
  List<Object?> get props => [];
}

class QuranStateLoading extends QuranState {
  @override
  List<Object?> get props => [];
}

//
class QuranStateLoaded extends QuranState {
  final List<SurahEntities> data;
  QuranStateLoaded({
    required this.data,
  });
  @override
  List<Object?> get props => [data];
}

class QuranStateError extends QuranState {
  final String error;

  QuranStateError({required this.error});
  @override
  List<Object?> get props => [error];
}
