import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/audios/presentation/pages/widgets/audio_ercitations_item_body.dart';

import '../../domain/entities/audio_entities.dart';
import '../manager/audio_manager_bloc/bloc.dart';
import '../manager/audio_the_reader_and_sura_name_bloc/bloc.dart';

class AudioRecitationsItem extends StatelessWidget {
  const AudioRecitationsItem({Key? key}) : super(key: key);
  static String id = "AudioRecitationsItem";
  @override
  Widget build(BuildContext context) {
    var _data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final AudioEntities _audioData = _data["audioData"];
    final List<String> _surasData = _data["surasData"];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_audioData.name),
        ),
        body: AudioRecitationsItemBody(
          audioData: _audioData,
          surasData: _surasData,
        ),
      ),
    );
  }
}
