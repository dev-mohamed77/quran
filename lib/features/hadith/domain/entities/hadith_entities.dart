import 'package:equatable/equatable.dart';

class HadithEntities extends Equatable {
  final int number;
  final String hadith;
  final String description;
  final String searchTerm;

  const HadithEntities({
    required this.number,
    required this.hadith,
    required this.description,
    required this.searchTerm,
  });

  @override
  List<Object> get props => [
        number,
        hadith,
        description,
        searchTerm,
      ];
}
