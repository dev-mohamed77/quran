import 'package:equatable/equatable.dart';

class AzkarEntities extends Equatable {
  final String category;
  final List<AzkarDataEntities> data;

  const AzkarEntities({
    required this.category,
    required this.data,
  });

  @override
  List<Object> get props => [category, data];
}

class AzkarDataEntities extends Equatable {
  final String title;
  final List<AzkarItemEntities> data;

  const AzkarDataEntities({
    required this.title,
    required this.data,
  });

  @override
  List<Object?> get props => [title, data];
}

class AzkarItemEntities extends Equatable {
  final String category;
  final String count;
  final String description;
  final String reference;
  final String zekr;

  const AzkarItemEntities({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.zekr,
  });

  @override
  List<Object> get props {
    return [
      category,
      count,
      description,
      reference,
      zekr,
    ];
  }
}
