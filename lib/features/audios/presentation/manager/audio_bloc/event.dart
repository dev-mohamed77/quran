import 'package:equatable/equatable.dart';

abstract class AudioEvent extends Equatable {}

class FetchAudioEvent extends AudioEvent {
  @override
  List<Object?> get props => [];
}

class AudioSearchEvent extends AudioEvent {
  final String query;
  AudioSearchEvent({
    required this.query,
  });
  @override
  List<Object?> get props => [query];
}

class AudioNoInternetEvent extends AudioEvent {
  @override
  List<Object?> get props => [];
}
