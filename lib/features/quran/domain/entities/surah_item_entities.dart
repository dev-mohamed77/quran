// import 'package:equatable/equatable.dart';

// class SurahItemEntities extends Equatable {
//   final String place;
//   final String type;
//   final int count;
//   final String title;
//   final String titleAr;
//   final String index;
//   final String pages;
//   final List<JuzEntities> juz;

//   const SurahItemEntities({
//     required this.place,
//     required this.type,
//     required this.count,
//     required this.title,
//     required this.titleAr,
//     required this.index,
//     required this.pages,
//     required this.juz,
//   });

//   @override
//   List<Object> get props {
//     return [
//       place,
//       type,
//       count,
//       title,
//       titleAr,
//       index,
//       pages,
//     ];
//   }
// }

// class JuzEntities extends Equatable {
//   final String index;
//   final VerseWithJuzEntities verse;

//   const JuzEntities({
//     required this.index,
//     required this.verse,
//   });

//   @override
//   List<Object> get props => [index, verse];
// }

// class VerseWithJuzEntities extends Equatable {
//   final String start;
//   final String end;

//   const VerseWithJuzEntities({
//     required this.start,
//     required this.end,
//   });

//   @override
//   List<Object> get props => [start, end];
// }
