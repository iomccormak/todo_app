import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_icons.dart';

class BottomBarButtons extends StatelessWidget {
  const BottomBarButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 740.h),
      height: 65.h,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.lightGrey,
            width: 1.w,
          ),
        ),
        color: AppColors.tabBarBackground,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 45.w,
              right: 290.w,
              top: 9.h,
            ),
            child: SvgPicture.asset(AppIcons.alphabetDescending),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 167.w,
              right: 167.w,
              top: 9.h,
            ),
            child: SvgPicture.asset(AppIcons.alphabetAscending),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 45.w,
              left: 290.w,
              top: 9.h,
            ),
            child: SvgPicture.asset(AppIcons.arrowAscending),
          ),
        ],
      ),
    );
  }
}
