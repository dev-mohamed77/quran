import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/settings/presentation/pages/widgets/setting_item_custom_swith.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../manager/settings_bloc/bloc.dart';
import '../../manager/settings_bloc/event.dart';
import '../../manager/settings_bloc/state.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        const SettingsItemCustomSwitch(),
        const DividerCustom(),
        const SettingThemeMode(),
        const DividerCustom()
      ],
    );
  }
}

class DividerCustom extends StatelessWidget {
  const DividerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return Divider(
          thickness: state.themeMode ? 1.h : 1.5.h,
          color: state.themeMode
              ? ColorManager.kWhiteColor
              : ColorManager.kGrey300Color,
        );
      },
    );
  }
}

class SettingThemeMode extends StatelessWidget {
  const SettingThemeMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 4.h),
          child: Row(
            children: [
              Text(StringsManager.changeThemeMode,
                  style: Theme.of(context).textTheme.headline6),
              const Spacer(),
              Switch(
                value: state.themeMode,
                onChanged: (val) {
                  context.read<SettingBloc>().add(
                        SettingEventSwitchThemeMode(val),
                      );
                },
                activeColor: ColorManager.kPurpleColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
