import 'package:equatable/equatable.dart';

import 'package:quran/features/azkar/domain/entities/azkar_entities.dart';

abstract class AzkarState extends Equatable {}

class AzkarStateLoading extends AzkarState {
  @override
  List<Object?> get props => [];
}

class AzkarStateLoaded extends AzkarState {
  final List<AzkarEntities> data;

  AzkarStateLoaded({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

// class AzkarStateCategoryLoaded extends AzkarState {
//   final List<String> data;

//   AzkarStateCategoryLoaded({
//     required this.data,
//   });

//   @override
//   List<Object?> get props => [data];
// }

class AzkarStateError extends AzkarState {
  final String message;

  AzkarStateError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
