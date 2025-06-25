import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: REdgeInsets.only(left: 30, right: 16),
            height: 1.h,
            color: ColorsManager.yellow,
          ),
        ),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: ColorsManager.yellow),
        ),
        Expanded(
          child: Container(
            margin: REdgeInsets.only(right: 30, left: 16),
            height: 1.h,
            color: ColorsManager.yellow,
          ),
        ),
      ],
    );
  }
}
