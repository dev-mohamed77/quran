import 'package:equatable/equatable.dart';

class QuranSettingState extends Equatable {
  final bool showTafseer;
  const QuranSettingState({
    required this.showTafseer,
  });

  @override
  List<Object> get props => [showTafseer];
}
