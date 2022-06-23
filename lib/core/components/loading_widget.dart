import 'package:flutter/material.dart';
import 'package:quran/core/utils/color_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
      backgroundColor: ColorManager.kPurpleColor,
      strokeWidth: 4.5,
      color: ColorManager.kPurpleColor,
    ));
  }
}
