import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quran/core/utils/color_manager.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/azkar/presentation/manager/tab_bloc/event.dart';
import 'package:quran/features/azkar/presentation/pages/widgets/azkar/azkar_category.dart';
import 'package:quran/features/azkar/presentation/pages/widgets/azkar/tab_item_custom.dart';

import '../../../manager/tab_bloc/bloc.dart';
import '../../../manager/tab_bloc/state.dart';

class AzkarBody extends StatelessWidget {
  const AzkarBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TabBloc, TabState>(
          builder: (context, state) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.all(17.w),
              decoration: BoxDecoration(
                color: ColorManager.kYellowColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TabItemCustom(
                    onClick: () {
                      if (!state.firstTab) {
                        BlocProvider.of<TabBloc>(context)
                            .state
                            .controller
                            .animateToPage(
                              0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                      }
                    },
                    icon: Icons.menu_book_outlined,
                    title: StringsManager.hesnMuslim,
                    border: Border(
                      bottom: BorderSide(
                        color: state.firstTab
                            ? ColorManager.kPurpleColor
                            : Colors.transparent,
                        width: 5.w,
                      ),
                    ),
                  ),
                  TabItemCustom(
                    onClick: () {
                      if (state.firstTab) {
                        BlocProvider.of<TabBloc>(context)
                            .state
                            .controller
                            .animateToPage(
                              1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                      }
                    },
                    icon: Icons.menu_open,
                    title: StringsManager.addAzkar,
                    border: Border(
                      bottom: BorderSide(
                        color: !state.firstTab
                            ? ColorManager.kPurpleColor
                            : Colors.transparent,
                        width: 5.w,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        BlocBuilder<TabBloc, TabState>(
          builder: (context, state) {
            return Expanded(
              child: PageView.builder(
                controller: state.controller,
                itemCount: 2,
                onPageChanged: (val) {
                  context.read<TabBloc>().add(ToggleTab(firstTab: val == 0));
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const AzkarCategory();
                  }
                  return const MyAzkar();
                },
              ),
            );
          },
        )
      ],
    );
  }
}

class MyAzkar extends StatelessWidget {
  const MyAzkar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Soon ..",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
