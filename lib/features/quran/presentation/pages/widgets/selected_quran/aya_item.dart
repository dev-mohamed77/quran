import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/utils/color_manager.dart';
import 'package:quran/features/settings/presentation/manager/settings_bloc/bloc.dart';

import '../../../../../settings/presentation/manager/settings_bloc/state.dart';
import '../../../../domain/entities/quran_entities.dart';
import '../../../manager/setting_bloc/bloc.dart';
import '../../../manager/setting_bloc/state.dart';

class AyaItem extends StatelessWidget {
  const AyaItem({
    Key? key,
    required this.aya,
  }) : super(key: key);

  final AyahsEntities aya;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 18.h,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: ColorManager.kGreyColor,
                  width: 1.5.h,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: BlocBuilder<SettingBloc, SettingState>(
                    builder: (context, state) {
                      return BlocBuilder<QuranSettingBloc, QuranSettingState>(
                        builder: (context, quranState) {
                          return Column(
                            children: [
                              Text(
                                aya.text,
                                textAlign: quranState.showTafseer
                                    ? TextAlign.center
                                    : TextAlign.start,
                                style: TextStyle(
                                  fontSize: state.fontSize.w,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (quranState.showTafseer)
                                SizedBox(
                                  height: 5.h,
                                ),
                              if (quranState.showTafseer)
                                Container(
                                  padding: EdgeInsets.all(8.h),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: ColorManager.kBlack12Color,
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  child: Text(
                                    aya.tafseer,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Text(
                  "(${aya.numberInSurah})",
                  style: TextStyle(
                    fontSize: 18.sm,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_border,
                color: state.themeMode
                    ? ColorManager.kWhiteColor
                    : ColorManager.kBlackColor,
                size: 26.h,
              ),
            );
          },
        )
      ],
    );
  }
}
