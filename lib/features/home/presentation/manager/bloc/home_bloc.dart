import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quran/features/home/domain/entities/home_entities.dart';

import '../../../domain/usecase/home_usecase_section2.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecase homeUsecase;

  HomeBloc({
    required this.homeUsecase,
  }) : super(const _Initial()) {
    on<HomeEvent>((event, emit) {
      emit(const HomeState.initial());

      (homeUsecase.call()).fold(
        (fail) {
          emit(HomeState.error(fail.message));
        },
        (data) {
          emit(HomeState.loaded(data));
        },
      );
    });
  }
}
