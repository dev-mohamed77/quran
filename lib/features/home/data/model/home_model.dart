import 'dart:convert';

import 'package:quran/features/home/domain/entities/home_entities.dart';

class HomeModel extends HomeEntities {
  final List<HomeModelData> topDataModel;
  final List<HomeModelData> bottomDataModel;

  const HomeModel({
    required this.topDataModel,
    required this.bottomDataModel,
  }) : super(
          topData: topDataModel,
          bottomData: bottomDataModel,
        );

  Map<String, dynamic> toMap() {
    return {
      'topData': topDataModel.map((x) => x.toMap()).toList(),
      'bottomData': bottomDataModel.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      topDataModel: List<HomeModelData>.from(
          map['topData']?.map((x) => HomeModelData.fromMap(x))),
      bottomDataModel: List<HomeModelData>.from(
          map['bottomData']?.map((x) => HomeModelData.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source));
}

class HomeModelData extends HomeDataEntities {
  final String titleModel;
  final String imageModel;

  const HomeModelData({
    required this.titleModel,
    required this.imageModel,
  }) : super(
          title: titleModel,
          image: imageModel,
        );

  Map<String, dynamic> toMap() {
    return {
      'title': titleModel,
      'image': imageModel,
    };
  }

  factory HomeModelData.fromMap(Map<String, dynamic> map) {
    return HomeModelData(
      titleModel: map['title'] ?? '',
      imageModel: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModelData.fromJson(String source) =>
      HomeModelData.fromMap(json.decode(source));
}
