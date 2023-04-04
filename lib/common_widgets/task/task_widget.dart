import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_text_styles.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({super.key, required this.task});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 334.w + 16.w,
          height: 60.h + 5.h,
          child: Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: false,
                  activeColor: AppColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(
                      width: 1.0,
                      color: Color.fromRGBO(232, 232, 232, 1),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 300.w,
                    child: Text(
                      task.title,
                      style: AppTextStyles.pageTextStyle,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    width: 121.w,
                    child: Text(
                      '${DateFormat('dd.MM.yyyy').format(task.date)}  ${task.time.hour.toString().padLeft(2, '0')}:${task.time.minute.toString().padLeft(2, '0')}',
                      style: AppTextStyles.dateTextStyle,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 21.h - 5.h,
        ),
      ],
    );
  }
}
