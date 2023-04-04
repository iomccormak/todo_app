import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/pages/add_task/widgets/app_bar_widget.dart';
import 'package:todo_app/pages/add_task/widgets/date_widget.dart';
import 'package:todo_app/pages/add_task/widgets/name_widget.dart';
import 'package:todo_app/pages/add_task/widgets/time_widget.dart';
import 'package:todo_app/utils/app_box_decorations.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:todo_app/utils/app_text_styles.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64.h),
        child: const AppBarWidget(),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 29.w, top: 37.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add a task',
              style: AppTextStyles.titleTextStyle,
            ),
            SizedBox(
              height: 43.h,
            ),
            const NameWidget(),
            TimeWidget(),
            DateWidget(),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 315.w,
                height: 46.h,
                decoration: AppBoxDecorations.blackBoxDecoration,
                alignment: Alignment.center,
                child: Text(
                  'Done',
                  style: AppTextStyles.buttonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
