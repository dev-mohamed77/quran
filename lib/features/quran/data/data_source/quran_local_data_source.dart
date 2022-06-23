import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/core/error_handler/failure/failure.dart';
import 'package:quran/core/utils/assets_manager.dart';
import 'package:quran/features/quran/data/model/surah_model.dart';

abstract class QuranLocalDataSource {
  Future<List<SurahModel>> fetchSurah();
}

class QuranLocalDataSourceImp extends QuranLocalDataSource {
  @override
  Future<List<SurahModel>> fetchSurah() async {
    try {
      var _surahJson =
          await rootBundle.loadString(AssetsManager.quranWithTafseer);

      var _convertData = json.decode(_surahJson);

      Iterable _surahData = _convertData["surahs"];

      List<SurahModel> _dataModel = [];

      for (var surah in _surahData) {
        SurahModel model = SurahModel.fromMap(surah);
        _dataModel.add(model);
      }
      return _dataModel;
    } catch (err) {
      throw LocalFailure;
    }
  }
}
