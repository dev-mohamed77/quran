import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../domain/entities/azkar_entities.dart';

class SelectCategoryItem extends StatelessWidget {
  const SelectCategoryItem({
    Key? key,
    required this.azkarData,
    required this.index,
  }) : super(key: key);

  final AzkarDataEntities azkarData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: ,
      margin: EdgeInsets.all(10.r),
      padding: EdgeInsets.all(30.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: (index % 2 == 0)
            ? ColorManager.kPurpleColor
            : ColorManager.kYellowColor,
      ),
      child: Text(
        azkarData.title,
        style: Theme.of(context).textTheme.headline6!.copyWith(
            color: (index % 2 == 0)
                ? ColorManager.kWhiteColor
                : ColorManager.kPurpleColor),
      ),
    );
  }
}
