import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_manager.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    Key? key,
    required this.image,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  final String image;
  final String text;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onClick,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 90.w,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: ColorManager.kWhiteColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
