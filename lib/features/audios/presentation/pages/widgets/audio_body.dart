import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quran/core/components/error_manager_ui.dart';
import 'package:quran/core/components/loading_widget.dart';
import 'package:quran/core/utils/assets_manager.dart';
import 'package:quran/core/utils/navigator_manager.dart';
import 'package:quran/features/audios/presentation/manager/audio_bloc/state.dart';
import 'package:quran/features/audios/presentation/pages/audio_recitations_item_scree.dart';
import 'package:quran/features/audios/presentation/pages/widgets/audio_item.dart';

import '../../manager/audio_bloc/bloc.dart';

class AudioBody extends StatelessWidget {
  const AudioBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _state = context.watch<AudioBloc>().state;
    print(_state);
    if (_state is AudioLoadingState) {
      return const LoadingWidget();
    } else if (_state is AudioLoadedState) {
      return ListView.builder(
        itemCount: _state.data.length,
        itemBuilder: (context, index) {
          List<String> _surahsData = _state.data[index].suras.split(",");

          return GestureDetector(
            onTap: () {
              NavigatorManager.navigatorPushNamed(
                ctx: context,
                route: AudioRecitationsItem.id,
                arg: {
                  "audioData": _state.data[index],
                  "surasData": _surahsData,
                },
              );
            },
            child: AudioItem(
              data: _state.data[index],
              index: index,
            ),
          );
        },
      );
    } else if (_state is AudioErrorState) {
      return ErrorManagerUi(errorMessage: _state.fail);
    } else if (_state is AudioNoInternetState) {
      return Center(
        child: Lottie.asset(
          AssetsManager.noInternetError,
          width: 200.w,
          height: 200.h,
        ),
      );
    }

    return Container();
  }
}
