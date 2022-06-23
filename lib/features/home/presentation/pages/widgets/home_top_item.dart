import 'package:flutter/material.dart';
import 'package:quran/core/utils/color_manager.dart';

import '../../../domain/entities/home_entities.dart';

class HomeTopItem extends StatelessWidget {
  const HomeTopItem({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final HomeDataEntities data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: index % 2 == 0
            ? ColorManager.kPurpleColor
            : ColorManager.kYellowColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              data.image,
              height: 70,
              width: 70,
            ),
            Text(
              data.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: (index % 2 == 0)
                    ? ColorManager.kWhiteColor
                    : ColorManager.kPurpleColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
