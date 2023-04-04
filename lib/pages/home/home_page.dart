import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/pages/empty_page.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_icons.dart';
import 'package:todo_app/utils/app_text_styles.dart';
import 'package:todo_app/common_widgets/buttons/bottom_bar_buttons.dart';
import 'package:todo_app/common_widgets/buttons/floating_buttons.dart';
import 'package:todo_app/common_widgets/task/task_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 27.w, top: 60.h),
            child: Text(
              'My tasks',
              style: AppTextStyles.titleTextStyle,
            ),
          ),
          SizedBox(
            height: 41.h,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 261.w,
              right: 14.w,
              top: 63.07.h + 11.h, //63
            ),
            child: GestureDetector(
              child: Text(
                'Hide completed',
                style: AppTextStyles.blueTextStyle,
              ),
              onTap: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 127.h - 17.h,
              left: 13.w,
            ),
            child: ListView(
              children: [
                TaskWidget(
                  task: Task(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    DateTime(2023, 5, 4),
                    TimeOfDay(hour: 11, minute: 20),
                  ),
                ),
                TaskWidget(
                  task: Task(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit something something',
                    DateTime(2023, 6, 4),
                    TimeOfDay(hour: 11, minute: 22),
                  ),
                ),
                TaskWidget(
                  task: Task(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    DateTime(2023, 5, 4),
                    TimeOfDay(hour: 13, minute: 39),
                  ),
                ),
              ],
            ),
          ),
          //EmptyPage(),
          const FloatingButtons(),
          const BottomBarButtons(),
        ],
      ),
    );
  }
}
