import 'package:quran/core/utils/assets_manager.dart';
import 'package:quran/features/onboarding/data/model/onboarding_model.dart';

abstract class OnboardingLocalDataSource {
  List<OnboardingModel> onboardingData();
}

class OnboardingLocalDataSourceImp implements OnboardingLocalDataSource {
  @override
  List<OnboardingModel> onboardingData() {
    List<OnboardingModel> _data = const [
      OnboardingModel(
        imageModel: AssetsManager.onboarding1,
        titleModel: "مرحبا بكم فى",
        subTitleModel: "برنامج القرآن الكريم",
      ),
      OnboardingModel(
        imageModel: AssetsManager.onboarding2,
        titleModel: "استماع مباشر",
        subTitleModel:
            "يمكنك الاستماع الى للآى سورة دون الحاجة الى تنزيل الملفات على جهازك",
      ),
      OnboardingModel(
        imageModel: AssetsManager.onboarding3,
        titleModel: "تلاوات متعددة",
        subTitleModel: "يوفر لك العديد من القراءات لمقرئين من مختلف الجنسيات",
      ),
      OnboardingModel(
        imageModel: AssetsManager.onboarding4,
        titleModel: "مرحبا بكم فى",
        subTitleModel: "برنامج القرآن الكريم",
      ),
    ];
    return _data;
  }
}
