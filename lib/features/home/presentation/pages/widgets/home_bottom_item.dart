import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/features/azkar/presentation/pages/azkar_screen.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../settings/presentation/manager/settings_bloc/bloc.dart';
import '../../../../settings/presentation/manager/settings_bloc/state.dart';
import '../../../domain/entities/home_entities.dart';

class HomeBottomItem extends StatelessWidget {
  const HomeBottomItem({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final HomeDataEntities data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (index == 0) {
              Navigator.pushNamed(context, AzkarScreen.id);
            }
          },
          borderRadius: BorderRadius.circular(15.r),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: state.themeMode
                  ? ColorManager.kDarkPlaceHolder
                  : (index % 2 == 0)
                      ? ColorManager.kYellowColor
                      : ColorManager.kPurpleColor,
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.title,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: state.themeMode
                              ? ColorManager.kWhiteColor
                              : (index % 2 == 0)
                                  ? ColorManager.kPurpleColor
                                  : ColorManager.kWhiteColor,
                        ),
                  ),
                  Image.asset(
                    data.image,
                    height: 65.h,
                    width: 65.w,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
