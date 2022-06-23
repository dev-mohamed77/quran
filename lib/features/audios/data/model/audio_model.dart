// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:quran/features/audios/domain/entities/audio_entities.dart';

class AudioModel extends AudioEntities {
  final String id;
  final String name;
  final String server;
  final String rewaya;
  final String count;
  final String letter;
  final String suras;

  const AudioModel({
    required this.id,
    required this.name,
    required this.server,
    required this.rewaya,
    required this.count,
    required this.letter,
    required this.suras,
  }) : super(
          id: id,
          name: name,
          server: server,
          rewaya: rewaya,
          count: count,
          letter: letter,
          suras: suras,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'Server': server,
      'rewaya': rewaya,
      'count': count,
      'letter': letter,
      'suras': suras,
    };
  }

  factory AudioModel.fromMap(Map<String, dynamic> map) {
    return AudioModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      server: map['Server'] ?? '',
      rewaya: map['rewaya'] ?? '',
      count: map['count'] ?? '',
      letter: map['letter'] ?? '',
      suras: map['suras'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AudioModel.fromJson(String source) =>
      AudioModel.fromMap(json.decode(source));
}
