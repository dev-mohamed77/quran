import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/components/error_manager_ui.dart';
import '../../../../../../core/components/loading_widget.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/navigator_manager.dart';
import '../../../../../../core/utils/strings_manager.dart';
import '../../../manager/hadith_bloc/hadith_bloc.dart';
import '../../../manager/hadith_bloc/hadith_event.dart';
import '../../../manager/hadith_bloc/hadith_state.dart';
import '../../hadith_description_screen.dart';
import '../hadith_item/hadith_item.dart';

class HadithSearchBody extends StatefulWidget {
  const HadithSearchBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HadithSearchBody> createState() => _HadithSearchBodyState();
}

class _HadithSearchBodyState extends State<HadithSearchBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _state = context.watch<HadithBloc>().state;

    if (_state is HadithStateLoading) {
      return const LoadingWidget();
    } else if (_state is HadithStateLoaded) {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              color: ColorManager.kGrey200Color,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18.w),
                bottomRight: Radius.circular(18.w),
              ),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "ابحث عن الحديث",
                    hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: ColorManager.kGrey300Color,
                        ),
                  ),
                  cursorColor: ColorManager.kPurpleColor,
                  onChanged: (val) {
                    context
                        .read<HadithBloc>()
                        .add(SearchAndFilterHadith(title: val));
                  },
                ),
              ),
            ),
          ),
          _state.data.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
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
                          isSearchPage: true,
                          query: _controller.text,
                        ),
                      );
                    },
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  child: Text(StringsManager.noHadith),
                )
        ],
      );
    } else if (_state is HadithStateError) {
      return ErrorManagerUi(errorMessage: _state.error);
    }
    return Container();
  }
}
