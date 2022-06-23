import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/color_manager.dart';

class ContainerCustom extends StatelessWidget {
  const ContainerCustom({
    Key? key,
    required this.index,
    required this.child,
  }) : super(key: key);

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      margin: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: (index % 2 == 0)
            ? ColorManager.kPurpleColor
            : ColorManager.kYellowColor,
      ),
      child: child,
    );
  }
}
