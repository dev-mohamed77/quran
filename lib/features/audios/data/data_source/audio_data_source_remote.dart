// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:quran/features/audios/data/model/audio_model.dart';

import '../../../../core/error_handler/failure/failure.dart';
import '../../../../core/helper/dio_helper.dart';

abstract class AudioDataSourceRemote {
  Future<List<AudioModel>> fetchAudio();
}

class AudioDataSourceRemoteImp extends AudioDataSourceRemote {
  final DioHelper dio;

  AudioDataSourceRemoteImp({
    required this.dio,
  });

  @override
  Future<List<AudioModel>> fetchAudio() async {
    try {
      final _response = await dio.fetchData(
        url:
            "reciters?fbclid=IwAR18NcPa5owhbQlvMkrrEM07z3oKAdYOJ-Qf1rj049U6t2cZsLL9r66GCXA",
      );

      Iterable _dataList = _response.data;

      List<AudioModel> _model = [];

      for (var _data in _dataList) {
        AudioModel _mdl = AudioModel.fromMap(_data);

        _model.add(_mdl);
      }

      return _model;
    } catch (err) {
      throw NetworkFailure;
    }
  }
}
