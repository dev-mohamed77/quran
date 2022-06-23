import 'package:equatable/equatable.dart';

class AudioTheReaderAndSurahNameState extends Equatable {
  final String theReader;
  final String surahName;

  const AudioTheReaderAndSurahNameState({
    required this.theReader,
    required this.surahName,
  });
  @override
  List<Object?> get props => [theReader, surahName];
}
