import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/utils/color_manager.dart';
import 'package:quran/features/quran/presentation/manager/quran_bloc/bloc.dart';
import 'package:quran/features/quran/presentation/manager/quran_bloc/state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/features/quran/presentation/manager/surah_bloc/surah_bloc.dart';
import 'package:quran/features/quran/presentation/pages/widgets/selected_quran/aya_item.dart';

import '../../../../../settings/presentation/manager/settings_bloc/bloc.dart';
import '../../../../../settings/presentation/manager/settings_bloc/state.dart';
import '../../../manager/surah_bloc/surah_state.dart';

class SelectedQuranBody extends StatelessWidget {
  const SelectedQuranBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: BlocBuilder<SelectSurahBloc, SelectedSurahState>(
        builder: (context, state) {
          if (state is SurahState) {
            return Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.surah.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                              Text(
                                "${BlocProvider.of<FetchQuranBloc>(context).typeSurah(state.surah.revelationType)} - ${BlocProvider.of<FetchQuranBloc>(context).surahCount(state.surah.ayahs.length)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Text(
                            state.surah.englishName,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: ColorManager.kWhiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const SelectedSurahItem(),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
                Expanded(
                  child: BlocBuilder<SettingBloc, SettingState>(
                    builder: (context, stateSetting) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.sm),
                            topRight: Radius.circular(20.sm),
                          ),
                          color: stateSetting.themeMode
                              ? ColorManager.kDarkPlaceHolder
                              : ColorManager.kWhiteColor,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: state.surah.ayahs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.sm),
                              child: AyaItem(
                                aya: state.surah.ayahs[index],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

class SelectedSurahItem extends StatelessWidget {
  const SelectedSurahItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _state = context.watch<FetchQuranBloc>().state;

    if (_state is QuranStateLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_state is QuranStateLoaded) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            _state.data.length,
            (index) => Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    context
                        .read<SelectSurahBloc>()
                        .add(SelectSurah(surah: _state.data[index]));
                  },
                  borderRadius: BorderRadius.circular(15.r),
                  child: Container(
                    padding: EdgeInsets.all(15.sm),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                        color: ColorManager.kWhiteColor,
                      ),
                    ),
                    child: Text(
                      _state.data[index].name,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 14.sm,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.kWhiteColor,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (_state is QuranStateError) {
      return Text(_state.error);
    }
    return Container();
  }
}
