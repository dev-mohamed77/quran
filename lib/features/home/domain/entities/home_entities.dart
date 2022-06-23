import 'package:equatable/equatable.dart';

class HomeEntities extends Equatable {
  final List<HomeDataEntities> topData;
  final List<HomeDataEntities> bottomData;

  const HomeEntities({
    required this.topData,
    required this.bottomData,
  });

  @override
  List<Object?> get props => [topData, bottomData];
}

class HomeDataEntities extends Equatable {
  final String title;
  final String image;

  const HomeDataEntities({
    required this.title,
    required this.image,
  });

  @override
  List<Object> get props => [title, image];
}
