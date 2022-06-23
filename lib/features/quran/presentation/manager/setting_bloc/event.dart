import 'package:equatable/equatable.dart';

abstract class QuranSettingEvent extends Equatable {}

class ShowTafseer extends QuranSettingEvent {
  final bool showTafseer;
  ShowTafseer({
    required this.showTafseer,
  });

  @override
  List<Object?> get props => [showTafseer];
}
