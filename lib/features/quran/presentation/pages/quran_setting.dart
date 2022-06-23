import 'package:flutter/material.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/quran/presentation/pages/widgets/quran_setting/quran_setting_body.dart';

class QuranSettingScreen extends StatelessWidget {
  const QuranSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringsManager.settings),
        ),
        body: const QuranSettingBody(),
      ),
    );
  }
}
