import 'package:equatable/equatable.dart';

class SettingState extends Equatable {
  final double fontSize;
  final bool themeMode;

  const SettingState({
    required this.fontSize,
    required this.themeMode,
  });

  @override
  List<Object> get props => [fontSize, themeMode];
}
