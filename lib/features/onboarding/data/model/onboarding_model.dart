import 'package:quran/features/onboarding/domain/entities/onboarding_entities.dart';

class OnboardingModel extends OnboardingEntities {
  final String imageModel;
  final String titleModel;
  final String subTitleModel;

  const OnboardingModel({
    required this.imageModel,
    required this.titleModel,
    required this.subTitleModel,
  }) : super(
          image: imageModel,
          title: titleModel,
          subTitle: subTitleModel,
        );
}
