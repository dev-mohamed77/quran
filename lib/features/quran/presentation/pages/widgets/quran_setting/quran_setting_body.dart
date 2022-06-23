import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/utils/strings_manager.dart';
import 'package:quran/features/quran/presentation/manager/setting_bloc/event.dart';

import '../../../manager/setting_bloc/bloc.dart';
import '../../../manager/setting_bloc/state.dart';

class QuranSettingBody extends StatelessWidget {
  const QuranSettingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranSettingBloc, QuranSettingState>(
      builder: (context, state) {
        return Column(
          children: [
            SwitchListTile(
              title: Text(
                StringsManager.showTafseer,
                style: Theme.of(context).textTheme.headline6,
              ),
              value: state.showTafseer,
              onChanged: (bool val) {
                context
                    .read<QuranSettingBloc>()
                    .add(ShowTafseer(showTafseer: val));
              },
            ),
          ],
        );
      },
    );
  }
}
