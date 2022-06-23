import 'package:flutter/material.dart';
import 'package:quran/features/azkar/presentation/pages/widgets/select_item_from_category/select_item_from_category_body.dart';

import '../../domain/entities/azkar_entities.dart';

class SelectItemFromCategoryScreen extends StatelessWidget {
  const SelectItemFromCategoryScreen({
    Key? key,
    required this.data,
    azkarData,
  }) : super(key: key);
  final AzkarDataEntities data;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(data.title),
        ),
        body: SelectItemFromCategoryBody(
          data: data.data,
        ),
      ),
    );
  }
}
