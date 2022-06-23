import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran/core/utils/color_manager.dart';
import 'package:quran/features/quran/presentation/pages/quran_setting.dart';
import 'package:quran/features/quran/presentation/pages/widgets/selected_quran/quran_body.dart';

import '../../../settings/presentation/manager/settings_bloc/bloc.dart';
import '../../../settings/presentation/manager/settings_bloc/state.dart';

class SelectedQuranScreen extends StatefulWidget {
  const SelectedQuranScreen({Key? key}) : super(key: key);
  static String id = "QuranScreen";

  @override
  State<SelectedQuranScreen> createState() => _SelectedQuranScreenState();
}

class _SelectedQuranScreenState extends State<SelectedQuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state.themeMode
                ? ColorManager.kDarkAppBar
                : ColorManager.kPurpleColor,
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const QuranSettingScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.settings,
                  ),
                ),
              ],
              elevation: 0,
            ),
            body: const SelectedQuranBody(),
          );
        },
      ),
    );
  }
}

// class ListTileCustom extends StatelessWidget {
//   const ListTileCustom({
//     Key? key,
//     required this.icon,
//     required this.title,
//     required this.onClick,
//   }) : super(key: key);

//   final IconData icon;
//   final String title;

//   final void Function() onClick;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(
//         icon,
//         color: ColorManager.kPurpleColor,
//       ),
//       title: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 17,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       trailing: const Icon(
//         Icons.arrow_forward_ios_rounded,
//         color: ColorManager.kPurpleColor,
//       ),
//       onTap: onClick,
//     );
//   }
// }
