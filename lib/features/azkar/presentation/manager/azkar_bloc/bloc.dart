import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran/features/azkar/domain/use_case/fetch_azkar.dart';
import 'package:quran/features/azkar/presentation/manager/azkar_bloc/event.dart';
import 'package:quran/features/azkar/presentation/manager/azkar_bloc/state.dart';

class AzkarBloc extends Bloc<AzkarEvent, AzkarState> {
  final UseCaseFetchAzkar useCaseFetchAzkar;
  AzkarBloc({
    required this.useCaseFetchAzkar,
  }) : super(AzkarStateLoading()) {
    on<FetchAzkarFromJson>((event, emit) async {
      emit(AzkarStateLoading());
      (await useCaseFetchAzkar.call()).fold(
        (fail) {
          emit(AzkarStateError(message: fail.message));
        },
        (data) {
          emit(AzkarStateLoaded(data: data.toSet().toList()));
        },
      );
    });
  }
}
