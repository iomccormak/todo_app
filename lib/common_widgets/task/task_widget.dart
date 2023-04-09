import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/domain/bloc/tasks_bloc.dart';
import 'package:todo_app/domain/models/task.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_text_styles.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 350.w,
          height: 65.h,
          child: Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: task.isDone,
                  activeColor: AppColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0.r),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(
                      width: 1.0,
                      color: Color.fromRGBO(232, 232, 232, 1),
                    ),
                  ),
                  onChanged: (bool? value) {
                    context.read<TasksBloc>().add(
                          DoneChange(
                            task: task,
                          ),
                        );
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300.w,
                    child: Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: !task.isDone
                          ? AppTextStyles.pageTextStyle
                          : AppTextStyles.pageTextStyleLined,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: 121.w,
                    child: Text(
                      '${DateFormat('dd.MM.yyyy  HH:mm').format(task.date)} ',
                      style: !task.isDone
                          ? AppTextStyles.dateTextStyle
                          : AppTextStyles.dateTextStyleLined,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
