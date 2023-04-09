import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/pages/add_task/add_task_page.dart';
import 'package:todo_app/pages/info/info_page.dart';
import 'package:todo_app/utils/app_icons.dart';

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
        bottom: 75.h,
      ),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Transform.scale(
            scale: 1.1.sp,
            child: GestureDetector(
              child: SvgPicture.asset(AppIcons.info),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoPage()),
                );
              },
            ),
          ),
          Transform.scale(
            scale: 1.1.sp,
            child: GestureDetector(
              child: SvgPicture.asset(AppIcons.add),
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  builder: (context) {
                    return SizedBox(
                      height: 773.h,
                      child: const AddTaskPage(),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
