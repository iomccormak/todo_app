import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:todo_app/utils/app_text_styles.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.tabBarBackground,
      elevation: 0,
      centerTitle: true,
      shape: const Border(
        bottom: BorderSide(
          color: AppColors.lightGrey,
          width: 0.5,
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 22.h),
        child: Text(
          'Task',
          style: AppTextStyles.addTaskTextStyle,
        ),
      ),
      leadingWidth: 77.w,
      leading: Padding(
        padding: EdgeInsets.only(top: 23.h),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              SizedBox(width: 9.w),
              SvgPicture.asset(AppIcons.chevron),
              SizedBox(width: 5.w),
              Text(
                'Close',
                style: AppTextStyles.closeButtonTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
