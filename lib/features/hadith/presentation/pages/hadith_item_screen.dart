import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran/core/utils/navigator_manager.dart';
import 'package:quran/features/hadith/presentation/manager/hadith_bloc/hadith_event.dart';
import 'package:quran/features/hadith/presentation/pages/widgets/hadith_item/hadith_item_body.dart';

import '../../../../depence_injection.dart';
import '../../domain/usecase/hadith_usecase_fetch_bukhari.dart';
import '../../domain/usecase/hadith_usecase_fetch_ibn_maja.dart';
import '../../domain/usecase/hadith_usecase_fetch_malik.dart';
import '../../domain/usecase/hadith_usecase_fetch_muslim.dart';
import '../../domain/usecase/hadith_usecase_fetch_nasai.dart';
import '../../domain/usecase/hadith_usecase_fetch_trmizi.dart';
import '../manager/hadith_bloc/hadith_bloc.dart';
import 'hadith_search_screen.dart';

class HadithItemScreen extends StatelessWidget {
  const HadithItemScreen({
    Key? key,
    required this.name,
    required this.event,
  }) : super(key: key);

  final String name;
  final HadithEvent event;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(name),
          actions: [
            IconButton(
              onPressed: () {
                NavigatorManager.navigatorPush(
                  ctx: context,
                  screen: BlocProvider(
                    create: (context) => HadithBloc(
                      fetchHadithBukhari:
                          getIt<HadithUseCaseFetchHadithBukhari>(),
                      fetchHadithIbnMaja:
                          getIt<HadithUseCaseFetchHadithIbnMaja>(),
                      fetchHadithMalik: getIt<HadithUseCaseFetchHadithMalik>(),
                      fetchHadithMuslim:
                          getIt<HadithUseCaseFetchHadithMuslim>(),
                      fetchHadithNasai: getIt<HadithUseCaseFetchHadithNasai>(),
                      fetchHadithTrmizi:
                          getIt<HadithUseCaseFetchHadithTrmizi>(),
                    )..add(event),
                    child: const HadithSearchScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
              ),
            )
          ],
        ),
        body: const HadithItemBody(),
      ),
    );
  }
}
