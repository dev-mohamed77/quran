import 'package:equatable/equatable.dart';

abstract class SettingEvent extends Equatable {}

class SettingEventAddFontSize extends SettingEvent {
  @override
  List<Object?> get props => [];
}

class SettingEventMinusFontSize extends SettingEvent {
  @override
  List<Object?> get props => [];
}

class SettingEventSwitchThemeMode extends SettingEvent {
  final bool themeMode;

  SettingEventSwitchThemeMode(this.themeMode);
  @override
  List<Object?> get props => [themeMode];
}
