import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quran/core/utils/color_manager.dart';

import 'package:quran/features/onboarding/domain/entities/onboarding_entities.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  final OnboardingEntities data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Lottie.asset(
          data.image,
          width: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.height * 0.45,
          alignment: Alignment.center,
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.h),
          child: Text(
            data.title,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 16.h,
                ),
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.h),
          child: Text(
            data.subTitle,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: ColorManager.kGreyColor,
                  fontSize: 13.h,
                ),
          ),
        ),
      ],
    );
  }
}
