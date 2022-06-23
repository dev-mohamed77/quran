// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/features/onboarding/presentation/manager/bloc/onboardingbloc_bloc.dart';
import 'package:quran/features/onboarding/presentation/manager/cubit/cubit.dart';
import 'package:quran/features/onboarding/presentation/pages/widgets/buttons_section.dart';
import 'package:quran/features/onboarding/presentation/pages/widgets/page_view_item.dart';

import '../../../../../core/components/error_manager_ui.dart';
import '../../../../../core/components/loading_widget.dart';

class OnboardingBody extends StatelessWidget {
  OnboardingBody({
    Key? key,
    required this.pageController,
  }) : super(key: key);
  final PageController pageController;
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    var state = context.watch<OnboardingBloc>().state;

    return state.when(
      initial: () => const LoadingWidget(),
      success: (data) {
        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  currentIndex = index;
                  BlocProvider.of<OnboardingCubit>(context)
                      .changeButton(index - 1);
                  return PageViewItem(
                    data: data[index],
                  );
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              // color: Colors.red,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.h),
                child: ButtonSection(
                  onClickNext: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeOutSine,
                    );
                    BlocProvider.of<OnboardingCubit>(context)
                        .changeButton(currentIndex);
                  },
                  onClickPrevious: () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeOutSine,
                    );
                    BlocProvider.of<OnboardingCubit>(context)
                        .changeButton(currentIndex);
                  },
                ),
              ),
            ),
          ],
        );
      },
      error: (err) => ErrorManagerUi(
        errorMessage: err,
      ),
    );
  }
}
