import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/utils/color_manager.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/home/presentation/pages/home_screen.dart';
import 'package:quran/features/onboarding/presentation/pages/widgets/onboarding_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: SmoothPageIndicator(
            controller: _pageController,
            count: 4,
            effect: WormEffect(
              dotHeight: 16.h,
              dotWidth: 19.2.w,
              dotColor: ColorManager.kGrey300Color,
              activeDotColor: ColorManager.kYellowColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomeScreen.id);
              },
              child: Text(
                StringsManager.skip,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: ColorManager.kWhiteColor),
              ),
            )
          ],
        ),
        body: OnboardingBody(pageController: _pageController),
      ),
    );
  }
}
