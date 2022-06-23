import 'package:equatable/equatable.dart';

abstract class AudioTheReaderAndSurahNameEvent extends Equatable {}

class AudioTheReaderAndSurahName extends AudioTheReaderAndSurahNameEvent {
  final String theReader;
  final String surahName;

  AudioTheReaderAndSurahName({
    required this.theReader,
    required this.surahName,
  });
  @override
  List<Object?> get props => [theReader, surahName];
}
