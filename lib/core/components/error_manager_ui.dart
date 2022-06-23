import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../utils/assets_manager.dart';

class ErrorManagerUi extends StatelessWidget {
  const ErrorManagerUi({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AssetsManager.lostCompassError,
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.width / 3,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            errorMessage,
            style: Theme.of(context).textTheme.headline5,
          )
        ],
      ),
    );
  }
}
