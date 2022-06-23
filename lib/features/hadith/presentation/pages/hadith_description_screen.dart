import 'package:flutter/material.dart';
import 'package:quran/features/hadith/presentation/pages/widgets/hadith_description/hadith_description.dart';

import '../../domain/entities/hadith_entities.dart';

class HadithDescriptionScreen extends StatelessWidget {
  const HadithDescriptionScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  final HadithEntities data;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("شرح الحديث"),
        ),
        body: HadithDescriptionBody(
          description: data.description,
        ),
      ),
    );
  }
}
