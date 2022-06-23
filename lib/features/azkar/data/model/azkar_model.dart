// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:quran/features/azkar/domain/entities/azkar_entities.dart';

class AzkarModel extends AzkarEntities {
  final String category;
  final List<AzkarDataModel> data;

  const AzkarModel({
    required this.category,
    required this.data,
  }) : super(category: category, data: data);

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory AzkarModel.fromMap(Map<String, dynamic> map) {
    return AzkarModel(
      category: map['category'] ?? '',
      data: List<AzkarDataModel>.from(
          map['data']?.map((x) => AzkarDataModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AzkarModel.fromJson(String source) =>
      AzkarModel.fromMap(json.decode(source));

  AzkarModel copyWith({
    String? category,
    List<AzkarDataModel>? data,
  }) {
    return AzkarModel(
      category: category ?? this.category,
      data: data ?? this.data,
    );
  }
}

class AzkarDataModel extends AzkarDataEntities {
  final String title;
  final List<AzkarItemModel> data;

  const AzkarDataModel({
    required this.title,
    required this.data,
  }) : super(title: title, data: data);

  AzkarDataModel copyWith({
    String? title,
    List<AzkarItemModel>? data,
  }) {
    return AzkarDataModel(
      title: title ?? this.title,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory AzkarDataModel.fromMap(Map<String, dynamic> map) {
    return AzkarDataModel(
      title: map['title'] ?? '',
      data: List<AzkarItemModel>.from(
          map['data']?.map((x) => AzkarItemModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AzkarDataModel.fromJson(String source) =>
      AzkarDataModel.fromMap(json.decode(source));

  @override
  String toString() => 'AzkarDataModel(title: $title, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AzkarDataModel &&
        other.title == title &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => title.hashCode ^ data.hashCode;
}

class AzkarItemModel extends AzkarItemEntities {
  final String category;
  final String count;
  final String description;
  final String reference;
  final String zekr;

  const AzkarItemModel({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.zekr,
  }) : super(
          category: category,
          count: count,
          description: description,
          reference: reference,
          zekr: zekr,
        );

  AzkarItemModel copyWith({
    String? category,
    String? count,
    String? description,
    String? reference,
    String? zekr,
  }) {
    return AzkarItemModel(
      category: category ?? this.category,
      count: count ?? this.count,
      description: description ?? this.description,
      reference: reference ?? this.reference,
      zekr: zekr ?? this.zekr,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'count': count,
      'description': description,
      'reference': reference,
      'zekr': zekr,
    };
  }

  factory AzkarItemModel.fromMap(Map<String, dynamic> map) {
    return AzkarItemModel(
      category: map['category'] ?? '',
      count: map['count'] ?? '',
      description: map['description'] ?? '',
      reference: map['reference'] ?? '',
      zekr: map['zekr'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AzkarItemModel.fromJson(String source) =>
      AzkarItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AzkarModel(category: $category, count: $count, description: $description, reference: $reference, zekr: $zekr)';
  }
}
