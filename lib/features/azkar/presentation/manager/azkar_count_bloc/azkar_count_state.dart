import 'package:equatable/equatable.dart';

class AzkarCountState extends Equatable {
  final double count;

  const AzkarCountState({
    required this.count,
  });

  @override
  List<Object?> get props => [count];
}
