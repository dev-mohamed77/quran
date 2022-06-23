// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:quran/features/hadith/domain/entities/hadith_entities.dart';

class HadithModel extends HadithEntities {
  final int number;
  final String hadith;
  final String description;
  final String searchTerm;

  const HadithModel({
    required this.number,
    required this.hadith,
    required this.description,
    required this.searchTerm,
  }) : super(
          number: number,
          hadith: hadith,
          description: description,
          searchTerm: searchTerm,
        );

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'hadith': hadith,
      'description': description,
      'searchTerm': searchTerm,
    };
  }

  factory HadithModel.fromMap(Map<String, dynamic> map) {
    return HadithModel(
      number: map['number']?.toInt() ?? 0,
      hadith: map['hadith'] ?? '',
      description: map['description'] ?? '',
      searchTerm: map['searchTerm'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HadithModel.fromJson(String source) =>
      HadithModel.fromMap(json.decode(source));

  HadithModel copyWith({
    int? number,
    String? hadith,
    String? description,
    String? searchTerm,
  }) {
    return HadithModel(
      number: number ?? this.number,
      hadith: hadith ?? this.hadith,
      description: description ?? this.description,
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
