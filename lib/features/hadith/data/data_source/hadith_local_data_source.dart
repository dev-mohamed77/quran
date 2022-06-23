import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/core/utils/assets_manager.dart';

import '../../../../core/error_handler/failure/failure.dart';
import '../model/hadith_model.dart';

abstract class HadithLocaLDataSource {
  Future<List<HadithModel>> fetchHadithBukhari();
  Future<List<HadithModel>> fetchHadithIbnMaja();
  Future<List<HadithModel>> fetchHadithMalik();
  Future<List<HadithModel>> fetchHadithMuslim();
  Future<List<HadithModel>> fetchHadithNasai();
  Future<List<HadithModel>> fetchHadithTrmizi();
}

class HadithLocaLDataSourceImp implements HadithLocaLDataSource {
  @override
  Future<List<HadithModel>> fetchHadithBukhari() async {
    try {
      var _res = await rootBundle.loadString(AssetsManager.hadithBukhari);
      var _resConvertJson = json.decode(_res);

      Iterable _dataList = _resConvertJson;

      List<HadithModel> _dataModel = [];

      for (var data in _dataList) {
        HadithModel _model = HadithModel.fromMap(data);

        _dataModel.add(_model);
      }
      return _dataModel;
    } catch (err) {
      throw LocalFailure;
    }
  }

  @override
  Future<List<HadithModel>> fetchHadithIbnMaja() async {
    try {
      var _res = await rootBundle.loadString(AssetsManager.hadithIbnMaja);
      var _resConvertJson = json.decode(_res);

      Iterable _dataList = _resConvertJson;

      List<HadithModel> _dataModel = [];

      for (var data in _dataList) {
        HadithModel _model = HadithModel.fromMap(data);

        _dataModel.add(_model);
      }
      return _dataModel;
    } catch (err) {
      throw LocalFailure;
    }
  }

  @override
  Future<List<HadithModel>> fetchHadithMalik() async {
    try {
      var _res = await rootBundle.loadString(AssetsManager.hadithMalik);
      var _resConvertJson = json.decode(_res);

      Iterable _dataList = _resConvertJson;

      List<HadithModel> _dataModel = [];

      for (var data in _dataList) {
        HadithModel _model = HadithModel.fromMap(data);

        _dataModel.add(_model);
      }
      return _dataModel;
    } catch (err) {
      throw LocalFailure;
    }
  }

  @override
  Future<List<HadithModel>> fetchHadithMuslim() async {
    try {
      var _res = await rootBundle.loadString(AssetsManager.hadithMuslim);
      var _resConvertJson = json.decode(_res);

      Iterable _dataList = _resConvertJson;

      List<HadithModel> _dataModel = [];

      for (var data in _dataList) {
        HadithModel _model = HadithModel.fromMap(data);

        _dataModel.add(_model);
      }
      return _dataModel;
    } catch (err) {
      throw LocalFailure;
    }
  }

  @override
  Future<List<HadithModel>> fetchHadithNasai() async {
    try {
      var _res = await rootBundle.loadString(AssetsManager.hadithNasai);
      var _resConvertJson = json.decode(_res);

      Iterable _dataList = _resConvertJson;

      List<HadithModel> _dataModel = [];

      for (var data in _dataList) {
        HadithModel _model = HadithModel.fromMap(data);

        _dataModel.add(_model);
      }
      return _dataModel;
    } catch (err) {
      throw LocalFailure;
    }
  }

  @override
  Future<List<HadithModel>> fetchHadithTrmizi() async {
    try {
      var _res = await rootBundle.loadString(AssetsManager.hadithTrmizi);
      var _resConvertJson = json.decode(_res);

      Iterable _dataList = _resConvertJson;

      List<HadithModel> _dataModel = [];

      for (var data in _dataList) {
        HadithModel _model = HadithModel.fromMap(data);

        _dataModel.add(_model);
      }
      return _dataModel;
    } catch (err) {
      throw LocalFailure;
    }
  }
}
