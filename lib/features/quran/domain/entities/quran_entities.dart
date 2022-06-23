import 'package:equatable/equatable.dart';

class SurahEntities extends Equatable {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final List<AyahsEntities> ayahs;

  const SurahEntities({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  @override
  List<Object?> get props => [
        number,
        name,
        englishName,
        englishNameTranslation,
        revelationType,
        ayahs,
      ];
}

class AyahsEntities extends Equatable {
  final int number;
  final String text;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final String tafseer;

  const AyahsEntities({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.tafseer,
  });

  @override
  List<Object?> get props => [
        number,
        text,
        numberInSurah,
        juz,
        manzil,
        page,
        ruku,
        hizbQuarter,
        tafseer,
      ];
}
