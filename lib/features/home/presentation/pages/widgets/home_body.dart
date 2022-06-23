import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/utils/assets_manager.dart';
import 'package:quran/core/utils/color_manager.dart';
import 'package:quran/core/utils/navigator_manager.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/hadith/presentation/pages/hadith_screen.dart';
import 'package:quran/features/home/presentation/pages/widgets/home_item.dart';
import 'package:quran/features/home/presentation/pages/widgets/home_listview_section.dart';
import 'package:quran/features/quran/presentation/pages/surahs_screen.dart';

import '../../../../audios/presentation/pages/audio_screen.dart';
import '../../../../settings/presentation/manager/settings_bloc/bloc.dart';
import '../../../../settings/presentation/manager/settings_bloc/state.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<SettingBloc, SettingState>(
            builder: (context, state) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                  color: state.themeMode
                      ? ColorManager.kDarkPlaceHolder
                      : ColorManager.kPurpleColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r),
                  ),
                ),
                child: Row(
                  children: [
                    HomeItem(
                      image: AssetsManager.homeQuran,
                      text: StringsManager.quran,
                      onClick: () {
                        NavigatorManager.navigatorPushNamed(
                          ctx: context,
                          route: SurahsScreen.id,
                        );
                      },
                    ),
                    HomeItem(
                      image: AssetsManager.homeTafseer,
                      text: StringsManager.hadith,
                      onClick: () {
                        NavigatorManager.navigatorPushNamed(
                          ctx: context,
                          route: HadithScreen.id,
                        );
                      },
                    ),
                    HomeItem(
                      image: AssetsManager.homeSound,
                      text: StringsManager.sound,
                      onClick: () {
                        NavigatorManager.navigatorPushNamed(
                          ctx: context,
                          route: AudioScreen.id,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.h),
            child: const HomeListViewSection(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }
}


// SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.width * 0.03,
//             ),
//             const Text(
//               "من تدبر القرآن طالبا الهدى منه",
//               style: TextStyle(
//                 fontSize: 17,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.width * 0.02,
//             ),
//             const Text(
//               "تبين له طريق الحق",
//               style: TextStyle(
//                 fontSize: 17,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.width * 0.03,
//             ),
//             const SizedBox(
//               width: double.infinity,
//               child: HomeListViewSection(),
//             ),
//           ],
//         ),
//       ),
//     );