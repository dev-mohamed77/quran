import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/color_manager.dart';

class TabItemCustom extends StatelessWidget {
  const TabItemCustom({
    Key? key,
    required this.onClick,
    required this.icon,
    required this.title,
    required this.border,
  }) : super(key: key);

  final void Function() onClick;
  final IconData icon;
  final String title;
  final BoxBorder border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(border: border),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Icon(
              icon,
              color: ColorManager.kPurpleColor,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: ColorManager.kPurpleColor,
                  ),
            ),
            SizedBox(
              height: 3.h,
            ),
          ],
        ),
      ),
    );
  }
}
