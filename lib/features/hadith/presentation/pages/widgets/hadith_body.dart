import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/components/item_custom.dart';

import 'package:quran/core/utils/navigator_manager.dart';
import 'package:quran/core/utils/strings_manager.dart';

import '../../../../../depence_injection.dart';
import '../../../domain/usecase/hadith_usecase_fetch_bukhari.dart';
import '../../../domain/usecase/hadith_usecase_fetch_ibn_maja.dart';
import '../../../domain/usecase/hadith_usecase_fetch_malik.dart';
import '../../../domain/usecase/hadith_usecase_fetch_muslim.dart';
import '../../../domain/usecase/hadith_usecase_fetch_nasai.dart';
import '../../../domain/usecase/hadith_usecase_fetch_trmizi.dart';
import '../../manager/hadith_bloc/hadith_bloc.dart';
import '../../manager/hadith_bloc/hadith_event.dart';
import '../hadith_item_screen.dart';

class HadithBody extends StatelessWidget {
  HadithBody({Key? key}) : super(key: key);

  final List<String> _dataList = [
    StringsManager.bukhari,
    StringsManager.ibnMaja,
    StringsManager.malik,
    StringsManager.nasai,
    StringsManager.trmizi,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(_dataList.length, (index) {
        return InkWell(
          onTap: () {
            if (index == 0) {
              pushScreenManager(
                  context, FetchHadithBukhari(), _dataList[index]);
            } else if (index == 1) {
              pushScreenManager(
                  context, FetchHadithIbnMaja(), _dataList[index]);
            } else if (index == 2) {
              pushScreenManager(context, FetchHadithMalik(), _dataList[index]);
            } else if (index == 3) {
              pushScreenManager(context, FetchHadithMuslim(), _dataList[index]);
            } else if (index == 4) {
              pushScreenManager(context, FetchHadithTrmizi(), _dataList[index]);
            }
          },
          child: ItemCustom(
            index: index,
            text: _dataList[index],
          ),
        );
      }),
    );
  }

  void pushScreenManager(BuildContext ctx, HadithEvent event, String name) {
    NavigatorManager.navigatorPush(
      ctx: ctx,
      screen: BlocProvider(
        create: (context) => HadithBloc(
          fetchHadithBukhari: getIt<HadithUseCaseFetchHadithBukhari>(),
          fetchHadithIbnMaja: getIt<HadithUseCaseFetchHadithIbnMaja>(),
          fetchHadithMalik: getIt<HadithUseCaseFetchHadithMalik>(),
          fetchHadithMuslim: getIt<HadithUseCaseFetchHadithMuslim>(),
          fetchHadithNasai: getIt<HadithUseCaseFetchHadithNasai>(),
          fetchHadithTrmizi: getIt<HadithUseCaseFetchHadithTrmizi>(),
        )..add(event),
        child: HadithItemScreen(
          name: name,
          event: event,
        ),
      ),
    );
  }
}
