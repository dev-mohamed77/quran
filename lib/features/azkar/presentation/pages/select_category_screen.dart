import 'package:flutter/material.dart';

import 'package:quran/features/azkar/presentation/pages/widgets/select_category/select_category_body.dart';

import '../../domain/entities/azkar_entities.dart';

class SelectCategoryScreen extends StatelessWidget {
  const SelectCategoryScreen({
    Key? key,
    required this.azkar,
  }) : super(key: key);
  final AzkarEntities azkar;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(azkar.category),
        ),
        body: SelectCategoryBody(
          azkar: azkar,
        ),
      ),
    );
  }
}
