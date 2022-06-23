import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/utils/color_manager.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/onboarding/presentation/manager/cubit/cubit.dart';
import 'package:quran/features/onboarding/presentation/manager/cubit/state.dart';

import 'package:quran/features/onboarding/presentation/pages/widgets/button_widget.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
    required this.onClickNext,
    required this.onClickPrevious,
  }) : super(key: key);

  final void Function() onClickNext;
  final void Function() onClickPrevious;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingCubitState>(
      builder: (context, state) {
        if (state is OnboardingCubitChangeOneButton) {
          return Padding(
            padding: EdgeInsets.only(right: 15.h, left: 15.h, bottom: 15.h),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                StringsManager.home,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: ColorManager.kWhiteColor),
              ),
              style: ElevatedButton.styleFrom(
                primary: ColorManager.kPurpleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<OnboardingCubit, OnboardingCubitState>(
              builder: (context, state) {
                return OnboardingButton(
                  onClick: onClickPrevious,
                  text: StringsManager.perv,
                  isButtonColor: state is OnboardingCubitChangeButtonColorNext,
                  onHighLightChangedColor: (val) {
                    BlocProvider.of<OnboardingCubit>(context)
                        .changeButtonNextColor(val);
                  },
                );
              },
            ),
            const SizedBox(
              width: 15,
            ),
            BlocBuilder<OnboardingCubit, OnboardingCubitState>(
              builder: (context, state) {
                return OnboardingButton(
                  onClick: onClickNext,
                  text: StringsManager.next,
                  onHighLightChangedColor: (val) {
                    BlocProvider.of<OnboardingCubit>(context)
                        .changeButtonPrevColor(val);
                  },
                  isButtonColor: state is OnboardingCubitChangeButtonColorPrev,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
