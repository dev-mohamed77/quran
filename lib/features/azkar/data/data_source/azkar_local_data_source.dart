import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/core/utils/assets_manager.dart';
import 'package:quran/features/azkar/data/model/azkar_model.dart';

import '../../../../core/error_handler/failure/failure.dart';

abstract class AzkarLocalDataSource {
  Future<List<AzkarModel>> fetchAzkar();
}

class AzkarLocalDataSourceImp extends AzkarLocalDataSource {
  @override
  Future<List<AzkarModel>> fetchAzkar() async {
    try {
      var _response = await rootBundle.loadString(AssetsManager.azkar);

      var _convertData = json.decode(_response);

      Iterable _dataList = _convertData;

      List<AzkarModel> _dataModel = [];

      for (var azkar in _dataList) {
        AzkarModel _model = AzkarModel.fromMap(azkar);

        _dataModel.add(_model);
      }

      return _dataModel;
    } catch (err) {
      throw LocalFailure;
    }
  }
}
