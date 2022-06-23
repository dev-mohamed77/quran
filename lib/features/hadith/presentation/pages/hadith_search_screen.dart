import 'package:flutter/material.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/hadith/presentation/pages/widgets/hadith_search/hadith_search_body.dart';

class HadithSearchScreen extends StatelessWidget {
  const HadithSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringsManager.searchHadith),
        ),
        body: const HadithSearchBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
