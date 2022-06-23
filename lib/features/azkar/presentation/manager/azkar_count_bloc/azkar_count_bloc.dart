import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/azkar/presentation/manager/azkar_count_bloc/azkar_count_event.dart';
import 'package:quran/features/azkar/presentation/manager/azkar_count_bloc/azkar_count_state.dart';

class AzkarCountBloc extends Bloc<AzkarCountEvent, AzkarCountState> {
  AzkarCountBloc() : super(const AzkarCountState(count: 0)) {
    on<AzkarAddCount>((event, emit) {
      emit(AzkarCountState(count: state.count + 1));
    });
  }
}
