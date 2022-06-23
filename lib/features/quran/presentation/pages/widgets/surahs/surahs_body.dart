import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/components/error_manager_ui.dart';
import 'package:quran/core/components/loading_widget.dart';
import 'package:quran/features/quran/presentation/manager/quran_bloc/bloc.dart';
import 'package:quran/features/quran/presentation/manager/quran_bloc/state.dart';
import 'package:quran/features/quran/presentation/manager/surah_bloc/surah_bloc.dart';
import 'package:quran/features/quran/presentation/pages/selected_quran_screen.dart';
import 'package:quran/features/quran/presentation/pages/widgets/surahs/surahs_names_item.dart';

class SurahsBody extends StatelessWidget {
  const SurahsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _state = context.watch<FetchQuranBloc>().state;

    if (_state is QuranStateLoading) {
      return const LoadingWidget();
    } else if (_state is QuranStateLoaded) {
      return ListView.builder(
        itemCount: _state.data.length,
        itemBuilder: (BuildContext context, int index) {
          var surah = _state.data[index];

          return GestureDetector(
            onTap: () {
              context.read<SelectSurahBloc>().add(SelectSurah(surah: surah));
              // print(tafseer);
              Navigator.of(context).pushNamed(
                SelectedQuranScreen.id,
              );
            },
            child: SurahNamesItem(
              data: _state.data[index],
              index: index + 1,
            ),
          );
        },
      );
    } else if (_state is QuranStateError) {
      return ErrorManagerUi(errorMessage: _state.error);
    }
    return Container();
  }
}
