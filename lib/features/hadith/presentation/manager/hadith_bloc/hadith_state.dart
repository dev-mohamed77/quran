import 'package:equatable/equatable.dart';

import 'package:quran/features/hadith/domain/entities/hadith_entities.dart';

abstract class HadithState extends Equatable {}

class HadithStateLoading extends HadithState {
  @override
  List<Object?> get props => [];
}

class HadithStateLoaded extends HadithState {
  final List<HadithEntities> data;

  HadithStateLoaded({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class HadithStateError extends HadithState {
  final String error;
  HadithStateError({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
