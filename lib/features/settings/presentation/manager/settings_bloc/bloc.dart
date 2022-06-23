import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/settings/presentation/manager/settings_bloc/event.dart';
import 'package:quran/features/settings/presentation/manager/settings_bloc/state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingState(fontSize: 18, themeMode: false)) {
    on<SettingEventAddFontSize>((event, emit) {
      emit(SettingState(
          fontSize: state.fontSize + 1, themeMode: state.themeMode));
    });
    on<SettingEventMinusFontSize>((event, emit) {
      emit(SettingState(
          fontSize: state.fontSize - 1, themeMode: state.themeMode));
    });
    on<SettingEventSwitchThemeMode>((event, emit) {
      emit(SettingState(fontSize: state.fontSize, themeMode: event.themeMode));
    });
  }
}
