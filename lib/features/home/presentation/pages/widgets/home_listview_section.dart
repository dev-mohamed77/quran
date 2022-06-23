import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/components/error_manager_ui.dart';
import 'package:quran/core/components/loading_widget.dart';
import 'package:quran/features/home/presentation/pages/widgets/home_bottom_item.dart';

import '../../manager/bloc/home_bloc.dart';

class HomeListViewSection extends StatelessWidget {
  const HomeListViewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _state = context.watch<HomeBloc>().state;

    return _state.when(
      initial: () => const LoadingWidget(),
      loaded: (data) => Column(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return HomeBottomItem(
                data: data.bottomData[index],
                index: index,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              );
            },
            shrinkWrap: true,
            itemCount: data.bottomData.length,
          ),
        ],
      ),
      error: (err) => ErrorManagerUi(errorMessage: err),
    );
  }
}
