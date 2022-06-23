import 'package:equatable/equatable.dart';

class AudioEntities extends Equatable {
  final String id;
  final String name;
  final String server;
  final String rewaya;
  final String count;
  final String letter;
  final String suras;

  const AudioEntities({
    required this.id,
    required this.name,
    required this.server,
    required this.rewaya,
    required this.count,
    required this.letter,
    required this.suras,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        server,
        rewaya,
        count,
        letter,
        // suras,
      ];
}
