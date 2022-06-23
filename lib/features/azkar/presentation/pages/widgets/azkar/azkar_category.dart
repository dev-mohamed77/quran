import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/features/azkar/domain/entities/azkar_entities.dart';
import 'package:quran/features/azkar/presentation/pages/select_category_screen.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/components/error_manager_ui.dart';
import '../../../../../../core/components/loading_widget.dart';
import '../../../manager/azkar_bloc/bloc.dart';
import '../../../manager/azkar_bloc/state.dart';

class AzkarCategory extends StatelessWidget {
  const AzkarCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AzkarState _state = context.watch<AzkarBloc>().state;

    if (_state is AzkarStateLoading) {
      return const LoadingWidget();
    } else if (_state is AzkarStateLoaded) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: _state.data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      SelectCategoryScreen(azkar: _state.data[index]),
                ),
              );
            },
            child: GridViewItem(
              data: _state.data[index],
            ),
          );
        },
      );
    } else if (_state is AzkarStateError) {
      return ErrorManagerUi(errorMessage: _state.message);
    }

    return Container();
  }
}

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  final AzkarEntities data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorManager.kPurpleColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Text(
            data.category,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: ColorManager.kWhiteColor,
                ),
          ),
        ),
      ),
    );
  }
}
