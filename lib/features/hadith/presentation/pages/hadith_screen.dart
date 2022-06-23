import 'package:flutter/material.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/hadith/presentation/pages/widgets/hadith_body.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({Key? key}) : super(key: key);

  static String id = "TafseerScreen";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringsManager.hadith),
        ),
        body: HadithBody(),
      ),
    );
  }
}
