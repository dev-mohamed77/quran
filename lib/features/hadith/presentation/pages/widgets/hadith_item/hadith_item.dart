import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../domain/entities/hadith_entities.dart';

class HadithItem extends StatelessWidget {
  HadithItem({
    Key? key,
    required this.data,
    required this.isSearchPage,
    String? query,
  })  : _query = query ?? "",
        super(key: key);

  final HadithEntities data;

  final bool isSearchPage;

  final String _query;

  final RegExp regex = RegExp('(?= )');

  @override
  Widget build(BuildContext context) {
    var _dataList = data.searchTerm.split(regex);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.all(15.w),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: ColorManager.kGrey200Color,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: !isSearchPage
              ? Text(
                  data.hadith,
                  style: Theme.of(context).textTheme.headline6,
                )
              : _query.isEmpty
                  ? Text(
                      data.hadith,
                      style: Theme.of(context).textTheme.headline6,
                    )
                  : RichText(
                      text: TextSpan(children: [
                        for (var word in _dataList)
                          TextSpan(
                            text: word,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      backgroundColor: word.contains(_query)
                                          ? ColorManager.kYellowColor
                                          : Colors.transparent,
                                      color: word.contains(_query)
                                          ? ColorManager.kWhiteColor
                                          : ColorManager.kBlackColor,
                                    ),
                          )
                      ]),
                    ),
        ),
        CircleAvatar(
          radius: 18.r,
          backgroundColor: ColorManager.kPurpleColor,
          child: Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Text(
              "${data.number}",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: ColorManager.kWhiteColor,
                    fontSize: 18.w,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
