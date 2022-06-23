import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quran/core/utils/color_manager.dart';
import 'package:quran/features/azkar/presentation/manager/azkar_count_bloc/azkar_count_bloc.dart';
import 'package:quran/features/azkar/presentation/manager/azkar_count_bloc/azkar_count_event.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../domain/entities/azkar_entities.dart';
import '../../../manager/azkar_count_bloc/azkar_count_state.dart';

class SelectItemFromCategoryBody extends StatefulWidget {
  const SelectItemFromCategoryBody({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<AzkarItemEntities> data;

  @override
  State<SelectItemFromCategoryBody> createState() =>
      _SelectItemFromCategoryBodyState();
}

class _SelectItemFromCategoryBodyState
    extends State<SelectItemFromCategoryBody> {
  late final PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: widget.data.length,
          effect: const WormEffect(
            dotWidth: 10,
            dotHeight: 10,
            dotColor: ColorManager.kYellowColor,
            activeDotColor: ColorManager.kPurpleColor,
            spacing: 2,
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.data.length,
            itemBuilder: (BuildContext context, int index) {
              var _azkarCountParse = double.parse(widget.data[index].count);

              return BlocProvider(
                create: (context) => AzkarCountBloc(),
                child: BlocBuilder<AzkarCountBloc, AzkarCountState>(
                  builder: (context, state) {
                    return Container(
                      margin: EdgeInsets.all(15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: ColorManager.kGrey200Color,
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30.r),
                        onTap: (() {
                          if (BlocProvider.of<AzkarCountBloc>(context)
                                  .state
                                  .count <
                              _azkarCountParse) {
                            context.read<AzkarCountBloc>().add(AzkarAddCount());
                          } else {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          }
                        }),
                        child: Padding(
                          padding: EdgeInsets.all(20.w),
                          child: ListView(
                            children: [
                              Text(
                                widget.data[index].zekr,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(height: 1.6),
                                textAlign: TextAlign.center,
                                softWrap: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              CircularPercentIndicator(
                                radius: 50.r,
                                animation: true,
                                lineWidth: 15.w,
                                progressColor: ColorManager.kPurpleColor,
                                percent: state.count / _azkarCountParse,
                                center: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.data[index].count,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 7.w),
                                      child: Text(
                                        "/",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ),
                                    Text(
                                      "${state.count.toInt()}",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
}
