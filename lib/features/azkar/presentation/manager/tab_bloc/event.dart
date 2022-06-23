import 'package:equatable/equatable.dart';

abstract class TabEvent extends Equatable {}

class ToggleTab extends TabEvent {
  final bool firstTab;
  ToggleTab({
    required this.firstTab,
  });
  @override
  List<Object?> get props => [firstTab];
}
