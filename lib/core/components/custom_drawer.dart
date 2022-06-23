import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/utils/strings_manager.dart';

import '../../features/settings/presentation/manager/settings_bloc/bloc.dart';
import '../../features/settings/presentation/manager/settings_bloc/state.dart';
import '../../features/settings/presentation/pages/settings_screen.dart';
import '../utils/assets_manager.dart';
import '../utils/color_manager.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return Drawer(
          backgroundColor: state.themeMode
              ? ColorManager.kDarkPlaceHolder
              : ColorManager.kWhiteColor,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: DrawerHeader(
                  child: Column(
                    children: [
                      TweenAnimationBuilder(
                        builder: (BuildContext context, double value, child) {
                          return Transform.translate(
                            offset: Offset(value * 200, 0.0),
                            child: child!,
                          );
                        },
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.slowMiddle,
                        tween: Tween(begin: 1.0, end: 0.0),
                        child: Image.asset(
                          AssetsManager.homeQuran,
                          height: 50.h,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        "قرآننا",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: ColorManager.kWhiteColor,
                            ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: state.themeMode
                        ? ColorManager.kDarkAppBar
                        : ColorManager.kPurpleColor,
                  ),
                  duration: const Duration(seconds: 15),
                  curve: Curves.ease,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, SettingsScreen.id);
                },
                title: Text(
                  StringsManager.settings,
                  style: Theme.of(context).textTheme.headline5,
                ),
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).iconTheme.color,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).iconTheme.color,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
