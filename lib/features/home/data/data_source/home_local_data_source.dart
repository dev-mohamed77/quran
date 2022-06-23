import 'package:quran/features/home/data/model/home_model.dart';

import '../../../../core/utils/assets_manager.dart';

abstract class HomeLocalDataSource {
  HomeModel getHomeData();
}

class HomeLocalDataSourceImp implements HomeLocalDataSource {
  @override
  HomeModel getHomeData() {
    final Map<String, dynamic> _data = {
      "topData": [
        {
          "title": "المصحف الشريف",
          "image": AssetsManager.homeQuran,
        },
        {
          "title": "صوتيات",
          "image": AssetsManager.homeSound,
        },
      ],
      "bottomData": [
        {
          "title": "الأذكار",
          "image": AssetsManager.homeAzkar,
        },
        {
          "title": "التسبيح",
          "image": AssetsManager.homeTasbe7,
        },
        {
          "title": "القبلة",
          "image": AssetsManager.homeQuran,
        },
        {
          "title": "مواقيت الصلاة",
          "image": AssetsManager.homeSound,
        },
      ],
    };

    return HomeModel.fromMap(_data);
  }
}
