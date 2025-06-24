import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/colors_manager.dart';

class ThemeManager {

  static final ThemeData dark = ThemeData(
      scaffoldBackgroundColor: ColorsManager.black,

      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: ColorsManager.white,
        prefixIconColor: ColorsManager.white,
        labelStyle: TextStyle(
          fontSize: 16.sp,
          color: ColorsManager.white,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
        ),
        filled: true,
        fillColor: ColorsManager.grey,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: ColorsManager.yellow,
              textStyle: TextStyle(
                color: ColorsManager.yellow,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r)),
              backgroundColor: ColorsManager.yellow,
              padding: REdgeInsets.symmetric(vertical: 12),
              foregroundColor: ColorsManager.black,
              textStyle: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.black))),
      textTheme: TextTheme(

        bodySmall: TextStyle(
            color: ColorsManager.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400),
        titleMedium: TextStyle(
            color: ColorsManager.grey,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400),
      )
  );
}
