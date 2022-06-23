import 'package:flutter/material.dart';
import 'package:quran/features/azkar/presentation/pages/widgets/select_category/select_category_item.dart';

import '../../../../../../core/utils/navigator_manager.dart';
import '../../../../domain/entities/azkar_entities.dart';
import '../../select_item_from_category_screen.dart';

class SelectCategoryBody extends StatelessWidget {
  const SelectCategoryBody({
    Key? key,
    required this.azkar,
  }) : super(key: key);

  final AzkarEntities azkar;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: azkar.data.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            NavigatorManager.navigatorPush(
              ctx: context,
              screen: SelectItemFromCategoryScreen(
                data: azkar.data[index],
              ),
            );
          },
          child: SelectCategoryItem(
            azkarData: azkar.data[index],
            index: index,
          ),
        );
      },
    );
  }
}
