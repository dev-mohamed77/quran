import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/utils/color_manager.dart';
import 'package:quran/core/utils/strings_manager.dart';

import '../../manager/settings_bloc/bloc.dart';
import '../../manager/settings_bloc/event.dart';
import '../../manager/settings_bloc/state.dart';

class SettingsItemCustomSwitch extends StatelessWidget {
  const SettingsItemCustomSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(StringsManager.fontSize,
                  style: Theme.of(context).textTheme.headline6),
              const Spacer(),
              _fontSizeButton(
                onCLick: () {
                  context.read<SettingBloc>().add(SettingEventAddFontSize());
                },
                icon: Icons.add,
                state: state,
              ),
              SizedBox(
                width: 3.w,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.5.h),
                child: Text(
                  "${state.fontSize}",
                  style: Theme.of(context).textTheme.headline6!,
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              _fontSizeButton(
                onCLick: () {
                  if (BlocProvider.of<SettingBloc>(context).state.fontSize >
                      0) {
                    context
                        .read<SettingBloc>()
                        .add(SettingEventMinusFontSize());
                  }
                },
                icon: Icons.remove,
                state: state,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _fontSizeButton({
    required Function() onCLick,
    required IconData icon,
    required SettingState state,
  }) {
    return InkWell(
      onTap: onCLick,
      borderRadius: BorderRadius.circular(10.r),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 25.w,
          height: 25.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(
              color: state.themeMode
                  ? ColorManager.kWhiteColor
                  : ColorManager.kGreyColor,
            ),
          ),
          child: Icon(icon),
        ),
      ),
    );
  }
}
