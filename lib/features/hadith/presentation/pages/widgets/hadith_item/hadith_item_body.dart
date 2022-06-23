import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran/core/components/error_manager_ui.dart';
import 'package:quran/core/components/loading_widget.dart';
import 'package:quran/core/utils/navigator_manager.dart';
import 'package:quran/features/hadith/presentation/manager/hadith_bloc/hadith_state.dart';
import 'package:quran/features/hadith/presentation/pages/hadith_description_screen.dart';

import '../../../manager/hadith_bloc/hadith_bloc.dart';
import 'hadith_item.dart';

class HadithItemBody extends StatelessWidget {
  const HadithItemBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _state = context.watch<HadithBloc>().state;
    if (_state is HadithStateLoading) {
      return const LoadingWidget();
    } else if (_state is HadithStateLoaded) {
      return ListView.builder(
        itemCount: _state.data.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              NavigatorManager.navigatorPush(
                ctx: context,
                screen: HadithDescriptionScreen(
                  data: _state.data[index],
                ),
              );
            },
            child: HadithItem(
              data: _state.data[index],
              isSearchPage: false,
            ),
          );
        },
      );
    } else if (_state is HadithStateError) {
      return ErrorManagerUi(errorMessage: _state.error);
    }
    return Container();
  }
}
