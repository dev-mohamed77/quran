import 'package:equatable/equatable.dart';

class OnboardingEntities extends Equatable {
  final String image;
  final String title;
  final String subTitle;

  const OnboardingEntities({
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  List<Object> get props => [image, title, subTitle];
}
