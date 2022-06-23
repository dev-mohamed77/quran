// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:quran/features/quran/domain/entities/quran_entities.dart';

class SurahModel extends SurahEntities {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final List<AyahsModel> ayahs;

  const SurahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  }) : super(
          number: number,
          name: name,
          englishName: englishName,
          englishNameTranslation: englishNameTranslation,
          revelationType: revelationType,
          ayahs: ayahs,
        );

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
      'englishName': englishName,
      'englishNameTranslation': englishNameTranslation,
      'revelationType': revelationType,
      'ayahs': ayahs.map((x) => x.toMap()).toList(),
    };
  }

  factory SurahModel.fromMap(Map<String, dynamic> map) {
    return SurahModel(
      number: map['number']?.toInt() ?? 0,
      name: map['name'] ?? '',
      englishName: map['englishName'] ?? '',
      englishNameTranslation: map['englishNameTranslation'] ?? '',
      revelationType: map['revelationType'] ?? '',
      ayahs: List<AyahsModel>.from(
          map['ayahs']?.map((x) => AyahsModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SurahModel.fromJson(String source) =>
      SurahModel.fromMap(json.decode(source));

  SurahModel copyWith({
    int? number,
    String? name,
    String? englishName,
    String? englishNameTranslation,
    String? revelationType,
    List<AyahsModel>? ayahs,
  }) {
    return SurahModel(
      number: number ?? this.number,
      name: name ?? this.name,
      englishName: englishName ?? this.englishName,
      englishNameTranslation:
          englishNameTranslation ?? this.englishNameTranslation,
      revelationType: revelationType ?? this.revelationType,
      ayahs: ayahs ?? this.ayahs,
    );
  }
}

class AyahsModel extends AyahsEntities {
  final int number;
  final String text;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final String tafseer;

  const AyahsModel({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.tafseer,
  }) : super(
          number: number,
          text: text,
          numberInSurah: numberInSurah,
          juz: juz,
          manzil: manzil,
          page: page,
          ruku: ruku,
          hizbQuarter: hizbQuarter,
          tafseer: tafseer,
        );

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'text': text,
      'numberInSurah': numberInSurah,
      'juz': juz,
      'manzil': manzil,
      'page': page,
      'ruku': ruku,
      'hizbQuarter': hizbQuarter,
      "tafseer": tafseer,
    };
  }

  factory AyahsModel.fromMap(Map<String, dynamic> map) {
    return AyahsModel(
      number: map['number']?.toInt() ?? 0,
      text: map['text'] ?? '',
      numberInSurah: map['numberInSurah']?.toInt() ?? 0,
      juz: map['juz']?.toInt() ?? 0,
      manzil: map['manzil']?.toInt() ?? 0,
      page: map['page']?.toInt() ?? 0,
      ruku: map['ruku']?.toInt() ?? 0,
      hizbQuarter: map['hizbQuarter']?.toInt() ?? 0,
      tafseer: map["tafseer"],
    );
  }

  String toJson() => json.encode(toMap());

  factory AyahsModel.fromJson(String source) =>
      AyahsModel.fromMap(json.decode(source));

  AyahsModel copyWith({
    int? number,
    String? text,
    int? numberInSurah,
    int? juz,
    int? manzil,
    int? page,
    int? ruku,
    int? hizbQuarter,
    String? tafseer,
  }) {
    return AyahsModel(
      number: number ?? this.number,
      text: text ?? this.text,
      numberInSurah: numberInSurah ?? this.numberInSurah,
      juz: juz ?? this.juz,
      manzil: manzil ?? this.manzil,
      page: page ?? this.page,
      ruku: ruku ?? this.ruku,
      hizbQuarter: hizbQuarter ?? this.hizbQuarter,
      tafseer: tafseer ?? this.tafseer,
    );
  }
}
