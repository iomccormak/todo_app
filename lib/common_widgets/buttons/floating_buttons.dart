import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/pages/add_task/add_task_page.dart';
import 'package:todo_app/pages/info/info.dart';
import 'package:todo_app/utils/app_icons.dart';

class FloatingButtons extends StatefulWidget {
  const FloatingButtons({super.key});

  @override
  State<FloatingButtons> createState() => _FloatingButtonsState();
}

class _FloatingButtonsState extends State<FloatingButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: 85.h,
      ), //20
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const InfoPage()));
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  builder: (context) {
                    return SizedBox(
                      height: 773.h,
                      child: AddTaskPage(),
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
