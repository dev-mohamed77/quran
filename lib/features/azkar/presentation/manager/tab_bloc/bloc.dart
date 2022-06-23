import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/azkar/presentation/manager/tab_bloc/event.dart';
import 'package:quran/features/azkar/presentation/manager/tab_bloc/state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc(PageController controller)
      : super(TabState(firstTab: true, controller: controller)) {
    on<ToggleTab>((event, emit) {
      emit(TabState(
        firstTab: event.firstTab,
        controller: state.controller,
      ));
    });
  }
}
