import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static const fontFamilyOpenSans = "Open Sans";

  static final titleTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 34.sp,
    fontWeight: FontWeight.w700,
  );

  static final pageTextStyle = TextStyle(
    color: AppColors.grey,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
  );

  static final buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 14.06.sp,
    fontWeight: FontWeight.w600,
  );

  static final blueTextStyle = TextStyle(
    color: AppColors.indigo,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
  );

  static final dateTextStyle = TextStyle(
    color: AppColors.lightGrey,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static final pageTextStyleLined = TextStyle(
    color: AppColors.taskLined,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.lineThrough,
    decorationThickness: 2,
  );

  static final dateTextStyleLined = TextStyle(
    color: AppColors.dateLined,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    decoration: TextDecoration.lineThrough,
    decorationThickness: 1.5,
  );

  static final dateTimeTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
  );

  static final closeButtonTextStyle = TextStyle(
    color: AppColors.indigo,
    fontSize: 17.sp,
    fontWeight: FontWeight.w400,
  );

  static final addTaskTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );

  static final addTitleTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
  );
}
