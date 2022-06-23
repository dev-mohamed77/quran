import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HadithDescriptionBody extends StatelessWidget {
  const HadithDescriptionBody({
    Key? key,
    required this.description,
  }) : super(key: key);
  final String description;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(20.0.w),
          child: Text(
            description,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(height: 1.7, wordSpacing: 1.7),
          ),
        ),
      ],
    );
  }
}
