import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quran/core/components/container_custom.dart';

import '../utils/color_manager.dart';

class ItemCustom extends StatelessWidget {
  const ItemCustom({
    Key? key,
    required this.index,
    required this.text,
  }) : super(key: key);

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ContainerCustom(
      index: index,
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: (index % 2 == 0)
                      ? ColorManager.kWhiteColor
                      : ColorManager.kPurpleColor,
                ),
          ),
          const Spacer(),
          SizedBox(width: 2.w),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: (index % 2 == 0)
                ? ColorManager.kWhiteColor
                : ColorManager.kPurpleColor,
          )
        ],
      ),
    );
  }
}
