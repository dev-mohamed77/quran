import 'package:flutter/material.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/audios/presentation/pages/widgets/audio_body.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({Key? key}) : super(key: key);

  static String id = "AudioScreen";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringsManager.sound),
        ),
        body: const AudioBody(),
      ),
    );
  }
}
