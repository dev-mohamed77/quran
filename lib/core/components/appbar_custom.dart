import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/utils/color_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
    required this.length,
    required this.controller,
    required this.title,
  }) : super(key: key);

  final int length;

  final PageController controller;
  final String title;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  Size get preferredSize => Size.fromHeight(75.h);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(7.h),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: ColorManager.kWhiteColor,
                  ),
            ),
          ),
          SmoothPageIndicator(
            controller: widget.controller,
            count: widget.length,
            effect: WormEffect(
              dotHeight: 10.h,
              dotWidth: 10.w,
              dotColor: ColorManager.kGrey300Color,
              activeDotColor: ColorManager.kYellowColor,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
