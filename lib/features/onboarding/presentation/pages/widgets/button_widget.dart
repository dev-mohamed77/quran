import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quran/core/utils/color_manager.dart';
import 'package:quran/features/onboarding/presentation/manager/cubit/cubit.dart';
import 'package:quran/features/onboarding/presentation/manager/cubit/state.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    Key? key,
    required this.onClick,
    required this.text,
    required this.onHighLightChangedColor,
    required this.isButtonColor,
  }) : super(key: key);

  final Function() onClick;
  final String text;
  final void Function(bool) onHighLightChangedColor;
  final bool isButtonColor;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingCubitState>(
      builder: (context, state) {
        return Expanded(
          child: InkWell(
            onTap: onClick,
            onHighlightChanged: onHighLightChangedColor,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.09,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: isButtonColor
                    ? ColorManager.kTealColor
                    : ColorManager.kPurpleColor,
              ),
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: ColorManager.kWhiteColor),
              ),
            ),
          ),
        );
      },
    );
  }
}
