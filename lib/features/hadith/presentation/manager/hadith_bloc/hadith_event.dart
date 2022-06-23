import 'package:equatable/equatable.dart';

abstract class HadithEvent extends Equatable {}

class FetchHadithBukhari extends HadithEvent {
  @override
  List<Object?> get props => [];
}

class FetchHadithIbnMaja extends HadithEvent {
  @override
  List<Object?> get props => [];
}

class FetchHadithMalik extends HadithEvent {
  @override
  List<Object?> get props => [];
}

class FetchHadithMuslim extends HadithEvent {
  @override
  List<Object?> get props => [];
}

class FetchHadithNasai extends HadithEvent {
  @override
  List<Object?> get props => [];
}

class FetchHadithTrmizi extends HadithEvent {
  @override
  List<Object?> get props => [];
}

class SearchAndFilterHadith extends HadithEvent {
  final String title;
  SearchAndFilterHadith({
    required this.title,
  });

  @override
  List<Object?> get props => [];
}
