import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/features/quran/presentation/manager/quran_bloc/bloc.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../domain/entities/quran_entities.dart';

class SurahNamesItem extends StatelessWidget {
  const SurahNamesItem({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final SurahEntities data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.h),
      child: SizedBox(
        width: double.infinity,
        child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(5.0.w),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.height * 0.045,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: ColorManager.kPurpleColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      "$index",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: ColorManager.kWhiteColor),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Text(
                        data.name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Row(
                        children: [
                          _subTitle(
                            context,
                            BlocProvider.of<FetchQuranBloc>(context)
                                .typeSurah(data.revelationType),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.09,
                          ),
                          _subTitle(
                            context,
                            BlocProvider.of<FetchQuranBloc>(context)
                                .surahCount(data.ayahs.length),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _subTitle(BuildContext context, title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: ColorManager.kGreyColor,
            fontSize: 13.5.h,
          ),
    );
  }
}
